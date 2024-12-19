import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../models/note.dart';

class EditNoteScreen extends StatelessWidget {
  final Note note;

  const EditNoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note.title);
    final contentController = TextEditingController(text: note.content);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Название'),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Описание'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<NotesProvider>(context, listen: false).updateNote(
                  note.id,
                  titleController.text,
                  contentController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
