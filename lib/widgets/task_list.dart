import 'package:daily_notes/models/task.dart';
import 'package:daily_notes/widgets/task_tile.dart';
import 'package:flutter/material.dart';

class TaskLists extends StatefulWidget {
  final List<Task> tasks;
  TaskLists(this.tasks);
  
  @override
  State<TaskLists> createState() => _TaskListsState();
}

class _TaskListsState extends State<TaskLists> {
  
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTittle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkBoxCallBack: (checkBoxState) {
            setState(() {
             widget.tasks[index].isDone = checkBoxState;
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
