import 'package:flutter/material.dart';
import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/pages/adding_page.dart';

class MyTiles extends StatelessWidget {
  const MyTiles({super.key});

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
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(13)),
                  height: 130,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ListTile(
                    leading: Icon(
                      Icons.check_box_outline_blank,
                      color: textcolor,
                    ),
                    title: Text(
                      "data",style: TextStyle(color:textcolor),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13), color: textcolor),
                  child: IconButton(
                    icon: Icon(Icons.delete, size: 32),
                    onPressed: () {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13), color: textcolor),
                  child: IconButton(
                    icon: const Icon(Icons.edit, size: 32),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewTodoPage(),)),
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
