import 'package:flutter/material.dart';

import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/models/todo.dart';


import 'package:my_todo_app/pages/adding_page.dart';


class MyTiles extends StatelessWidget {
 final void Function() onPressed;
  final Todo toodo;
  final String titles;
  final String descriptions;
  final Function(bool?)? onchanged;
  final bool taskcompleted;
  const MyTiles(
      {super.key,
      required this.taskcompleted,
      required this.onchanged,
      required this.titles,
      required this.descriptions,
       required this.onPressed, required this.toodo});

  @override
  Widget build(BuildContext context) {
     

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
                      checkColor: Color.fromARGB(255, 9, 255, 0),
                      activeColor: Colors.white,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(2.0),
  ),
  side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.0, color: Colors.red),
  ),

     
      
      
                      value: taskcompleted, onChanged: onchanged,

                      
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
                    icon: const Icon(Icons.delete, size: 32),
                    onPressed:onPressed
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
                          builder: (context) => NewTodoPage(todo: toodo),
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
