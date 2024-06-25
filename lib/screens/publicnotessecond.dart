import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'imageview.dart';
import 'pdfview.dart';
import 'second.dart';

class UploadScreen extends StatefulWidget {
  final String did;
  final String type;
  final String url;

  UploadScreen({
    required this.did,
    required this.type,
    required this.url,
  });

  @override
  State<UploadScreen> createState() => _UploadScreenState(
    did: did,
    type: type,
    url: url,
  );
}

class _UploadScreenState extends State<UploadScreen> {
  String did;
  String type;
  String url;

  _UploadScreenState({
    required this.did,
    required this.type,
    required this.url,
  });

  final _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  var vis = false;
  List<Map<String, dynamic>> uploadedFiles = [];

  @override
  void initState() {
    super.initState();
    fetchUploadedFiles();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              var catalogues = ref
                  .doc(_auth.currentUser!.uid)
                  .collection('folders')
                  .doc(did)
                  .collection(type)
                  .get();
              catalogues.then((value) => value.docs.remove(value));

              ref
                  .doc(_auth.currentUser!.uid)
                  .collection('folders')
                  .doc(did)
                  .delete()
                  .whenComplete(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      url: url,
                    ),
                  ),
                );
              });
            },
            icon: Icon(
              Icons.delete_forever,
              color: Colors.redAccent,
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(type == 'PDF' ? 'Edpal Pdf' : 'Edpal Photos'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Stack(
        children: [
          Center(
            child: Visibility(
              visible: vis,
              child: CircularProgressIndicator(
                color: Colors.indigo[800],
              ),
            ),
          ),
          ListView.builder(
            itemCount: uploadedFiles.length,
            itemBuilder: (context, index) {
              final file = uploadedFiles[index];
              return ListTile(
                title: Text(file['name']),
                trailing: IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () {
                    downloadFile(file['url'], file['name']);
                  },
                ),
                onTap: () {
                  // Handle file preview or download here
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectAndUploadFile();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<void> selectAndUploadFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: type == 'PDF' ? ['pdf'] : ['jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        final file = result.files.single;
        final fileName = file.name;
        final fileBytes = kIsWeb ? file.bytes : File(file.path!).readAsBytesSync();

        setState(() {
          vis = true;
        });

        // Upload file to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref().child(type).child(fileName);
        final uploadTask = storageRef.putData(fileBytes!);

        // Get download URL after upload completes
        final snapshot = await uploadTask;
        final downloadUrl = await snapshot.ref.getDownloadURL();

        // Get current user ID
        final user = _auth.currentUser!;
        final uploaderId = user.uid;

        // Add file details to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('folders')
            .doc(did)
            .collection(type)
            .add({
          'name': fileName,
          'url': downloadUrl,
          'uploaderId': uploaderId,
        });

        setState(() {
          vis = false;
        });

        // Fluttertoast.showToast(
        //   msg: 'File uploaded successfully!',
        //   textColor: Colors.green,
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File uploaded successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Refresh the uploaded files list
        fetchUploadedFiles();
      }
    } catch (e) {
      // Fluttertoast.showToast(
      //   msg: 'Failed to upload file: $e',
      //   textColor: Colors.red,
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to download file!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> downloadFile(String url, String fileName) async {
    try {
      final response = await http.get(Uri.parse(url));
      final String path = (await getExternalStorageDirectory())!.path;
      File file = File('$path/$fileName');
      await file.writeAsBytes(response.bodyBytes);

      if (mounted) {
        // Fluttertoast.showToast(
        //   msg: 'File downloaded successfully!',
        //   textColor: Colors.green,
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File downloaded successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        // Fluttertoast.showToast(
        //   msg: 'Failed to download file: $e',
        //   textColor: Colors.red,
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download file!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  Future<void> fetchUploadedFiles() async {
    try {
      final snapshot = await ref
          .doc(_auth.currentUser!.uid)
          .collection('folders')
          .doc(did)
          .collection(type)
          .get();

      final files = snapshot.docs.map((doc) => doc.data()).toList();

      setState(() {
        uploadedFiles = files.cast<Map<String, dynamic>>();
      });
    } catch (e) {
      print('Error fetching files: $e');
    }
  }
}
