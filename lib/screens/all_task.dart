import 'package:daily_notes/models/task_data.dart';
import 'package:daily_notes/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('All Task'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
              child: Text(
            "${Provider.of<TaskData>(context).taskCount} Task",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Consumer<TaskData>(
        builder: (context, taskData, _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTittle: task.name,
                taskSubTitle: task.subname,
                checkBoxCallBack: (checkboxState) {
                  taskData.upDateTask(task);
                },
              );
            },
            itemCount: taskData.taskCount,
          );
        },
      ),
    );
  }
}
