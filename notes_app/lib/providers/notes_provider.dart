import 'package:flutter/material.dart';
import '../models/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => [..._notes];

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(String id, String title, String content) {
    final noteIndex = _notes.indexWhere((note) => note.id == id);
    if (noteIndex != -1) {
      _notes[noteIndex].title = title;
      _notes[noteIndex].content = content;
      notifyListeners();
    }
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  void reorderNotes(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;
    final note = _notes.removeAt(oldIndex);
    _notes.insert(newIndex, note);
    notifyListeners();
  }
}
