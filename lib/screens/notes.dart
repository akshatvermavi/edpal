// import 'package:flutter/material.dart';
//
// class NotesPage extends StatelessWidget {
//   const NotesPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notes'),
//       ),
//       body: const Center(
//         child: Text('This is the Notes Page!'),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

// ...



class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<String> uploadedNotes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _uploadNotes(),
              child: const Text('Upload Notes (PDF)'),
            ),
            const SizedBox(height: 20),
            _buildUploadedNotes(),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadedNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Uploaded Notes:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: uploadedNotes
              .map((note) =>
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(note),
              ))
              .toList(),
        ),
      ],
    );
  }

  Future<void> _uploadNotes() async {
    // You can implement the file picker or use any file picker package to get the file path.
    // For simplicity, this example uses a placeholder method for file picking.
    String? filePath = await _pickFile();

    if (filePath != null) {
      setState(() {
        uploadedNotes.add(filePath);
      });
    }
  }




  // Future<String> _pickFile() async {
  //   // Placeholder method for picking a file. Replace this with a file picker package or your own implementation.
  //   // This example assumes you have a PDF file named "sample.pdf" in the root directory.
  //   // You need to replace this with your actual file picking logic.
  //   return 'sample.pdf';
  // }
  Future<String?> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      return file.path;
    } else {
      return null;
    }
  }
}

