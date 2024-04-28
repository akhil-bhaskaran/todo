import 'package:flutter/material.dart';
import 'package:my_todo_app/components/styles.dart';
import 'package:my_todo_app/components/tiles.dart';
import 'package:my_todo_app/models/todo_dataabase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title:const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            "Hey Do It",
            style: TextStyle(
                fontSize: 23,
                fontFamily: AutofillHints.countryCode,
                color: Colors.white),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: 
       ListView.builder(itemBuilder: (context, index,) => const MyTiles(),itemCount: ),
    );
  }
}
