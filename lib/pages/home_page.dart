import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/components/tiles.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/models/todo_dataabase.dart';
import 'package:my_todo_app/pages/adding_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    readTodos();
  }

  void readTodos() {
    context.read<TodoDatabase>().fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    final todoDatabase = context.watch<TodoDatabase>();
    // List of Todos
    List<Todo> currentTodos = TodoDatabase.currentTodos;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            "Taskify",
            style: TextStyle(
                fontSize: 27, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
            ),
            child: IconButton(
              style:
                  ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.amber)),
              icon: const Icon(
                Icons.add,
              ),
              iconSize: 26,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewTodoPage(),
                    ));
              },
            ),
          )
        ],
      ),
      body: currentTodos.isEmpty
          ? Center(
              child: Text(
                "No TODO is present!!!",
                style: TextStyle(fontSize: 19, color: textcolor),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final todo = currentTodos[index];

                return MyTiles(
                  titles: todo.title,
                  descriptions: todo.description,
                  taskcompleted: todo.checked,
                  onchanged: (value) {
                    setState(() {
                      todo.checked = !todo.checked;
                      context.read<TodoDatabase>().insertTodo(todo);
                    });
                  },
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            backgroundColor: iconscolor,
                            content: Text(
                              "Do you want to delete this Task?",
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No",
                                    style: TextStyle(color: textcolor)),
                              ),
                              TextButton(
                                  onPressed: () {
                                    todoDatabase.deleteTodo(todo.id);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: textcolor),
                                  ))
                            ]);
                      },
                    );

                    setState(() {});
                  },
                  toodo: currentTodos[index],
                );
              },
              itemCount: currentTodos.length,
            ),
    );
  }
}
