import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../models/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.content),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              '/edit',
              arguments: note,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Provider.of<NotesProvider>(context, listen: false)
                  .deleteNote(note.id);
            },
          ),
        ],
      ),
    );
  }
}
