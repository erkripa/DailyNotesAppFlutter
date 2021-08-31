import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Buy Vegetables",
        style: TextStyle(
          decoration: isChecked! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing:  TaskCheckBox(
        chekboxState: isChecked,
        toggleCheckboxState: (bool? checkBoxState){
          setState(() {
            isChecked = checkBoxState;
          });
        },
      )
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  TaskCheckBox({@required this.chekboxState,@required this.toggleCheckboxState});

  final bool? chekboxState;
 final Function(bool?)? toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: chekboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
