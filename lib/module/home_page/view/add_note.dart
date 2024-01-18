// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final dateController = TextEditingController();
  late TextEditingController _dateController;
  DateTime? _pickedDate;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
      text: _pickedDate != null
          ? "${_pickedDate!.year}-${_pickedDate!.month}-${_pickedDate!.day}"
          : '',
    );
  }

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
              onChanged: (value) {},
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
              onChanged: (value) {},
            ),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _pickedDate = pickedDate;
                    _dateController.text =
                        "${_pickedDate!.year}-${_pickedDate!.month}-${_pickedDate!.day}";
                  });
                }
              },
              child: TextFormField(
                readOnly: true,
                controller: _dateController,
                maxLength: 20,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'Birth date',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  suffixIcon: Icon(Icons.date_range),
                ),
                onChanged: (value) {},
              ),
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
                  if (_pickedDate == null ||
                      !_formKey.currentState!.validate() ||
                      titleController.text.isEmpty ||
                      contentController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Isi semua kolom dengan benar'),
                      ),
                    );
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
