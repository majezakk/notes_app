import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../models/note.dart';
import 'package:uuid/uuid.dart';

class AddNoteScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Название'),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Описание'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final id = const Uuid().v4();
                final newNote = Note(
                  id: id,
                  title: _titleController.text,
                  content: _contentController.text,
                );
                Provider.of<NotesProvider>(context, listen: false)
                    .addNote(newNote);
                Navigator.of(context).pop();
              },
              child: const Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }
}
