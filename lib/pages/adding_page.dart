import 'package:flutter/material.dart';
import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/components/txtfield.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/models/todo_dataabase.dart';
import 'package:my_todo_app/utils/notifications_conf.dart';
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
    // context.watch<TodoDatabase>().editTodo(,titleTextEditingController.text ,descTexteditingController.text );
    // if(titleTextEditingController!=null && descTexteditingController!=null){

    // }
  }

  //create Todo
  void createTodo() {
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

  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descTexteditingController = TextEditingController();
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
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.birthdayDay,
                color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            "What Shall I Remember You?",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: AutofillHints.birthday),
          ),
          const SizedBox(height: 100),
          TxtField(
              htext: "title(required)", controller: titleTextEditingController),
          TxtField(htext: "Description", controller: descTexteditingController),
          // Expanded(child: Column()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: ElevatedButton(
                onPressed: createTodo,
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(textcolor),
                    foregroundColor: MaterialStatePropertyAll(iconscolor)),
                child: const Text("Submit"),
              )),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SendNot(),
                      ));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(textcolor),
                    foregroundColor: MaterialStatePropertyAll(iconscolor)),
                child: const Text("Remind me!"),
              )),
            ],
          ),
        ]),
      ),
    );
  }
}
