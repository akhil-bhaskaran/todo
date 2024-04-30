import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    readTodos();
  }
  void readTodos(){
    context.read<TodoDatabase>().fetchTodo();
  }

  
  
  @override
  Widget build(BuildContext context) {
    final todoDatabase =context.watch<TodoDatabase>();
    // List of Todos
    List<Todo> currentTodos=TodoDatabase.currentTodos;
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
      body: currentTodos.isEmpty?Center(child: Text("No TODO is present!!!",style: TextStyle(fontSize: 19,color: textcolor),),)
       :ListView.builder(itemBuilder: (context, index) {
        
        
        final todo =currentTodos[index];

        return MyTiles( titles:todo.title ,descriptions:todo.description ,taskcompleted:todo.checked ,onchanged:null,Indexes: todo.id,);},
       itemCount: currentTodos.length,),
      floatingActionButton: FloatingActionButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) =>NewTodoPage() ,));}),
    );
  }
}
   