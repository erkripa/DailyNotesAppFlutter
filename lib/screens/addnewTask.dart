import 'package:daily_notes/constant.dart';
import 'package:daily_notes/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    String? newTaskSubTitle;
    return Container(
      color: Color(0xff737373),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextFormField(
              decoration: textformFieldDecoration,
              autofocus: true,
              textAlign: TextAlign.left,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextFormField(
              decoration: textformFieldDecoration.copyWith(
                  hintText: 'Enter Your new task descriptions.'),
              autofocus: true,
              textAlign: TextAlign.left,
              onChanged: (newText) {
                newTaskSubTitle = newText;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!, newTaskSubTitle!);
                Navigator.pop(context);
              },
              child: Text(
                "Add",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
