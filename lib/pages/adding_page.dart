import 'package:flutter/material.dart';
import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/components/txtfield.dart';
import 'package:my_todo_app/utils/notifications_conf.dart';

class NewTodoPage extends StatefulWidget {
 
   NewTodoPage({super.key});

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
   TextEditingController titleTextEditingController =   TextEditingController();
  TextEditingController descTexteditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        TxtField(Htext: "title(required)",controller:titleTextEditingController ),
        TxtField(Htext: "Description",controller: descTexteditingController),
        const Expanded(child: Column(),),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SendNot(),));
        }, child: Text("Remind me!"))
      ]),
    );
  }
}

