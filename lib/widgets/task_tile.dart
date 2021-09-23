import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTittle;
  final String? taskSubTitle;
  final Function(bool?)? checkBoxCallBack;
  final Function()? longPressCallBack;

  TaskTile({
    @required this.taskTittle,
    @required this.taskSubTitle,
    @required this.isChecked,
    this.checkBoxCallBack,
    this.longPressCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longPressCallBack,
        title: Text(
          taskTittle!,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            decoration: isChecked! ? TextDecoration.lineThrough : null,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          taskSubTitle!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallBack,
        ));
  }
}
