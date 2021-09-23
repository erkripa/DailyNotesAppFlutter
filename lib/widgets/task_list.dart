import 'package:daily_notes/models/task.dart';
import 'package:daily_notes/models/task_data.dart';
import 'package:daily_notes/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTittle: task.name,
            taskSubTitle: task.subname,
            isChecked: task.isDone,
            checkBoxCallBack: (checkBoxState) {
              taskData.upDateTask(task);
            },
            longPressCallBack: () {
              alertMethod(context, taskData, task).show();
              // taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }

  Alert alertMethod(BuildContext context, TaskData taskData, Task task) {
    return Alert(
      context: context,
      type: AlertType.info,
      title: "Alert",
      desc: "Are you sure want to delete the Task.",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(
                color: Colors.white,
                // fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            taskData.deleteTask(task);
            Navigator.pop(context);
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(
                color: Colors.white,
                // fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ],
          ),
        )
      ],
    );
  }
}
