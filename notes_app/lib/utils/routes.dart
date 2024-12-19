import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/add_note_screen.dart';
import '../screens/edit_note_screen.dart';
import '../models/note.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/add':
        return MaterialPageRoute(builder: (_) => AddNoteScreen());
      case '/edit':
        final note = settings.arguments as Note;
        return MaterialPageRoute(builder: (_) => EditNoteScreen(note: note));
      default:
        return null;
    }
  }
}
