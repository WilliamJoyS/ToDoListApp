import 'package:flutter/material.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/todo_tiles.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference hive box

  final _myBox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createinitialdata();
    } else {
      //if there is data
      db.loaddata();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //Checkbox was tapped
  void checkboxchange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updatedatabase();
  }

//save new task
  void savenewtask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear(); //clear text di create task,
      //kalau gak pakai bakal munculin task sebelumnya
    });
    Navigator.of(context).pop();
    db.updatedatabase();
  }

//create new task
  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onsave: savenewtask,
            oncancel: () => Navigator.of(context)
                .pop(), //ngilangin dialog boxnya dengan pop
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updatedatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow[600],
          title: Text("TO DO"),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[600],
          onPressed: createnewtask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkboxchange(value, index),
                deletefunction: (context) => deleteTask(index),
              );
            }));
  }
}
