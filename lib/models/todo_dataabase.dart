import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:path_provider/path_provider.dart';
class TodoDatabase extends ChangeNotifier{
static late Isar _isar ;
static final List<Todo> currentTodos=[];
//INTIALISE
static Future<void> initialise()async{
  final dir= await getApplicationDocumentsDirectory();
  _isar =await Isar.open([TodoSchema], directory: dir.path);
}
// CREATE A TODOO
Future<void> insertTodo(String usertitle,String userdescription)async{

  final newTodo = Todo(title:usertitle , description:userdescription );
    // save to db
    await _isar.writeTxn(() => _isar.todos.put(newTodo));
    //re-read from db
   await fetchTodo();
}

// EDITING THE TODO
// Future<void> editTodo(int id,String ?userNewTitle,String userNewTitle)async{
//   final existingTodo=await _isar.todos.get(id);
//   // ignore: prefer_conditional_assignment
//   if(existingTodo==null){
//     existingTodo=
//   }


// }

// DELETING THE TODOO
Future<void> deleteTodo(int id)async{
 await _isar.writeTxn(() => _isar.todos.delete(id));
 currentTodos.removeAt(id);
 await fetchTodo();
}

// DISPLAYING ALL THE TODO 
Future<void> fetchTodo()async{
 List<Todo> fetchedNotes = await _isar.todos.where().findAll();
    currentTodos.clear();
    currentTodos.addAll(fetchedNotes);
     notifyListeners();

}


}