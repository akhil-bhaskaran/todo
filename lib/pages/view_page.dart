import 'package:flutter/material.dart';
import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/models/todo.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: textcolor),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        child: ListView(
          children: [
            Text(
              todo.title.toUpperCase(),
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 231, 226, 226),
              ),
            ),
            Divider(
              thickness: 2.5,
              height: 23,
              endIndent: 5,
            ),
            Text(
              todo.description,
              style: TextStyle(color: textcolor, fontSize: 16),
            )
          ],
        ),
      )),
    );
  }
}
