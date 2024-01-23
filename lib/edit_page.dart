// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:wtc_notes/data/datasources/local_datasources.dart';
import 'package:wtc_notes/home_page_view.dart';

import 'data/models/note_data.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
    required this.notes,
  }) : super(key: key);
  final Note notes;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.notes.title;
    contentController.text = widget.notes.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
        actions: const [],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextFormField(
              controller: titleController,
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
              controller: contentController,
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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Note note = Note(
              id: widget.notes.id,
              title: titleController.text,
              content: contentController.text,
              createAt: DateTime.now(),
            );
            LocalDataSources().updateNoteById(note);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          }
        },
      ),
    );
  }
}
