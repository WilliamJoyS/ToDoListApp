import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onsave;
  final VoidCallback oncancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[600],
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                MyButton(text: "Save", onPressed: onsave),
                const SizedBox(
                  width: 10,
                ),
                //delete
                MyButton(text: "Cancel", onPressed: oncancel)
              ],
            ) //buttons -> save + cancel
          ],
        ),
      ),
    );
  }
}
