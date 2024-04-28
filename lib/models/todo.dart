import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection

class Todo {

  Id id = Isar.autoIncrement;
  late String title;
  late String description;
  late bool checked;

  Todo({required this.title, required this.description, this.checked = false});
}
