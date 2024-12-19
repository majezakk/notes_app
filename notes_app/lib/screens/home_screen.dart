import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../widgets/note_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Заметки'),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          notesProvider.reorderNotes(oldIndex, newIndex);
        },
        children: notesProvider.notes
            .map((note) => NoteItem(
                  key: ValueKey(note.id),
                  note: note,
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
