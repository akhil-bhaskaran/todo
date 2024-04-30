import 'package:flutter/material.dart';

import 'package:my_todo_app/components/styles.dart';

import 'package:my_todo_app/models/todo_dataabase.dart';
import 'package:my_todo_app/pages/adding_page.dart';
import 'package:provider/provider.dart';

class MyTiles extends StatelessWidget {
  final int Indexes;
  final String titles;
  final String descriptions;
  Function(bool?)? onchanged;
  final bool taskcompleted;
  MyTiles(
      {super.key,
      required this.taskcompleted,
      required this.onchanged,
      required this.titles,
      required this.descriptions,
      required this.Indexes});

  @override
  Widget build(BuildContext context) {
    final todoDatabase = context.watch<TodoDatabase>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 130,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(13)),
                  height: 130,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ListTile(
                    leading: Checkbox(
                      value: taskcompleted, onChanged: onchanged,

                      // Icons.check_box_outline_blank,
                      // color: textcolor,
                    ),
                    title: Text(
                      titles,
                      style: TextStyle(color: textcolor, fontSize: 22),
                    ),
                    subtitle:
                        Text(descriptions, style: TextStyle(color: textcolor)),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: textcolor),
                  child: IconButton(
                    icon: Icon(Icons.delete, size: 32),
                    onPressed: () => TodoDatabase().deleteTodo(Indexes),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: textcolor),
                  child: IconButton(
                    icon: const Icon(Icons.edit, size: 32),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewTodoPage(),
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
