import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/notes_provider.dart';
import 'utils/routes.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesProvider()),
      ],
      child: MaterialApp(
        title: 'Заметки',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
