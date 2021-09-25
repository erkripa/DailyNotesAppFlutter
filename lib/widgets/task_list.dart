import 'package:daily_notes/models/task_data.dart';
import 'package:daily_notes/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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
            formatedDate: task.date,
            isChecked: task.isDone,
            checkBoxCallBack: (checkBoxState) {
              taskData.upDateTask(task);
            },
            ontap: () {
              taskData.alertMethod(context, task);
            },
            onTextTap: () {
              AwesomeDialog(
                context: context,
                headerAnimationLoop: false,
                dialogType: DialogType.NO_HEADER,
                title: task.name,
                customHeader: Image.asset(
                  'assets/logo.png',
                  height: 78,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                desc: task.subname,
                btnOkOnPress: () {
                  debugPrint('OnClcik');
                },
                btnOkColor: Colors.lightBlueAccent,
                btnOkIcon: Icons.check_circle,
              )..show();
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
