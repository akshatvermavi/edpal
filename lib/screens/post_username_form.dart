
import 'package:flutter/material.dart';

class UserNameForm extends StatefulWidget {
  final Function(String) onSave;

  const UserNameForm({Key? key, required this.onSave}) : super(key: key);

  @override
  _UserNameFormState createState() => _UserNameFormState();
}

class _UserNameFormState extends State<UserNameForm> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter your name'),
      content: TextField(
        controller: _nameController,
        decoration: const InputDecoration(hintText: 'Your name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final name = _nameController.text;
            if (name.isNotEmpty) {
              widget.onSave(name);
              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
