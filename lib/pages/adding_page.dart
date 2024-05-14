import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/components/txtfield.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/models/todo_dataabase.dart';

import 'package:provider/provider.dart';

class NewTodoPage extends StatefulWidget {
  final Todo? todo;

  const NewTodoPage({super.key, this.todo});

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  @override
  void initState() {
    if (widget.todo != null) {
      titleTextEditingController.text = widget.todo!.title;
      descTexteditingController.text = widget.todo!.description;
    } else {
      return;
    }
    super.initState();
  }

  //create Todo
  void createTodo() {
    if (validator1()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        content: Text("Please Enter a Title",
            style: GoogleFonts.poppins(textStyle: TextStyle(color: textcolor))),
      ));
    } else {
      if (widget.todo == null) {
        Todo newTodo = Todo(
            title: titleTextEditingController.text,
            description: descTexteditingController.text);
        context.read<TodoDatabase>().insertTodo(newTodo);

        Navigator.pop(context);
        titleTextEditingController.clear();
        descTexteditingController.clear();
      } else {
        widget.todo!.title = titleTextEditingController.text;
        widget.todo!.description = descTexteditingController.text;
        context.read<TodoDatabase>().insertTodo(widget.todo!);

        Navigator.pop(context);
        titleTextEditingController.clear();
        descTexteditingController.clear();
      }
    }
  }

  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descTexteditingController = TextEditingController();
  bool validator1() {
    return (titleTextEditingController.text.isEmpty);
  }

  final formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Hey There!",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            "What Shall I Remember You?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 100),
          TxtField(
            htext: "title(required)",
            controller: titleTextEditingController,
          ),
          TxtField(
            htext: "Description",
            controller: descTexteditingController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: ElevatedButton(
                onPressed: createTodo,
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(textcolor),
                    foregroundColor: WidgetStatePropertyAll(iconscolor)),
                child: const Text("Submit"),
              )),
            ],
          ),
        ]),
      ),
    );
  }
}
