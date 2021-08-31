import 'package:daily_notes/models/task.dart';
import 'package:daily_notes/widgets/task_tile.dart';
import 'package:flutter/material.dart';

class TaskLists extends StatefulWidget {
  @override
  State<TaskLists> createState() => _TaskListsState();
}

class _TaskListsState extends State<TaskLists> {
  final List<Task> tasks = [
    Task(name: "Buy Egg"),
    Task(name: "Buy Ornage"),
    Task(name: "Buy Apple"),
    Task(name: "Buy Banana"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTittle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkBoxCallBack: (checkBoxState) {
            setState(() {
              tasks[index].isDone = checkBoxState;
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
