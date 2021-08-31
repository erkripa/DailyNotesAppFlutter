import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget { 
 
 final bool? isChecked;
  final String? taskTittle;
  final Function(bool?)? checkBoxCallBack;

  TaskTile({@required this.taskTittle,@required this.isChecked,this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
 