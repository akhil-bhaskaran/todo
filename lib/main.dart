import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo_dataabase.dart';
import 'package:my_todo_app/pages/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.initialise();
  runApp(ChangeNotifierProvider(
    create: (context) => TodoDatabase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
