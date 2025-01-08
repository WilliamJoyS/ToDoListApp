import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deletefunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deletefunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding antar appbar dengan container
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefunction,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(9.0),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                  activeColor: Colors.black,
                  value: taskCompleted,
                  onChanged: onChanged),
              //task name
              Text(taskName,
                  style: TextStyle(
                      fontSize: 17.0,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow[600],
              borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    ); //padding dalam container
  }
}
