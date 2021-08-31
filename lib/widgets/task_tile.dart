import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget { 
 
 final bool? isChecked;
  final String? taskTittle;
  final Function(bool?)? checkBoxCallBack;
  final Function()? longPressCallBack;

  TaskTile({@required this.taskTittle,@required this.isChecked,this.checkBoxCallBack,this.longPressCallBack,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTittle!,
        style: TextStyle(
          decoration: isChecked! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged:  checkBoxCallBack,
        )
    );
  }
}
 