import 'package:daily_notes/constant.dart';
import 'package:daily_notes/models/task_data.dart';
import 'package:daily_notes/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      if (taskData.taskCount == 0) {
        return Center(
          child: Text(
            "Your Notebook is Empty!",
            style: GoogleFonts.mcLaren(
              textStyle: kTextEmtystyle,
            ),
          ),
        );
      }
      return ListView.builder(
        
        itemBuilder: (context, index) {
         
          final task = taskData.tasks[index];
          return TaskTile(
            taskTittle: task.name,
            taskSubTitle: task.subname,
            formatedDate: task.date,
            isChecked: task.isDone,
            checkBoxCallBack: (checkBoxState) {
              taskData.upDateTask(task);
            },
            ontap: () {
              taskData.alertMethod(context, task);
            },
            onTextTap: () {
             taskData.dialogInfo(context, task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }

}
