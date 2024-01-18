// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
        actions: const [],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Title harus diisi";
              }
              return null;
            },
            onChanged: (value) {},
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            maxLines: 8,
            decoration: const InputDecoration(
              labelText: 'Content',
              border: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.solid),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Content harus diisi";
              }
              return null;
            },
            onChanged: (value) {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          //
        },
      ),
    );
  }
}
