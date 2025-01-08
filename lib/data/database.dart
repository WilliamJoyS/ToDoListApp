import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  // reference box
  List toDoList = [];
  final _myBox = Hive.box("mybox");

  //run if this is the first time opening this app
  void createinitialdata() {
    toDoList = [
      ["Study", false],
      ["Do exercise", false],
    ];
  }

  //load data from database
  void loaddata() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update database
  void updatedatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
