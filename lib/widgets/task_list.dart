import 'package:daily_notes/models/task_data.dart';
import 'package:daily_notes/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskTittle: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            checkBoxCallBack: (checkBoxState) {
              // setState(() {
              //  widget.tasks[index].isDone = checkBoxState;
              // });
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
