// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:wtc_notes/data/datasources/local_datasources.dart';
import 'package:wtc_notes/home_page_view.dart';

import 'data/models/note_data.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Note",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Title wajib diisi";
                }
                return null; // atau return null; jika tidak ada masalah
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              maxLines: 8,
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.solid),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Content wajib diisi";
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Note note = Note(
                      title: titleController.text,
                      content: contentController.text,
                      creatAt: DateTime.now(),
                    );
                    LocalDataSources().insertNote(note);
                    titleController.clear();
                    contentController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Data Berhasil Masuk Uwu")));
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Simpan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
