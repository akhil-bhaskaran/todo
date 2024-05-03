import 'package:flutter/material.dart';
import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/components/txtfield.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/models/todo_dataabase.dart';
import 'package:my_todo_app/utils/notifications_conf.dart';
import 'package:provider/provider.dart';

class NewTodoPage extends StatefulWidget {
  
  final Todo ?todo;
  final int ?id;
  const NewTodoPage({super.key, required this.id, required this.todo});

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  @override
  void initState() {
    
    super.initState();
    // context.watch<TodoDatabase>().editTodo(,titleTextEditingController.text ,descTexteditingController.text );
    // if(titleTextEditingController!=null && descTexteditingController!=null){

    // }
    
  }
  //create Todo
  void createTodo() {
    context.read<TodoDatabase>().insertTodo(
        titleTextEditingController.text, descTexteditingController.text);
        Navigator.pop(context);
        titleTextEditingController.clear();
        descTexteditingController.clear();
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
        padding: const EdgeInsets.symmetric(vertical:10,horizontal: 20 ),
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
              Htext: "title(required)", controller: titleTextEditingController),
          TxtField(Htext: "Description", controller: descTexteditingController),
          // Expanded(child: Column()),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: ElevatedButton(
                onPressed: createTodo,
                child: Text("Submit"),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(textcolor),
                    foregroundColor: MaterialStatePropertyAll(iconscolor)),
              )),
               Center(
                  child: ElevatedButton(
                onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendNot(),
                    ));
              },
              child: Text("Remind me!"),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(textcolor),
                    foregroundColor: MaterialStatePropertyAll(iconscolor)),
              )),
            ],
          ),
          
        ]),
      ),
    );
  }
}
