import 'dart:collection';

import 'package:daily_notes/models/task.dart';
import 'package:flutter/Material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String? newTaskTitle, String newSubTitle, String date) {
    final task = Task(name: newTaskTitle, subname: newSubTitle, date: date);
    _tasks.add(task);

    notifyListeners();
  }

  void upDateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

    String formattedDate = DateFormat('dd/MM/yyyy  kk:mm').format(DateTime.now());


  void alertMethod(BuildContext context, Task task) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Alert",
      desc: "Are you sure want to delete the Task.",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(
                color: Colors.white,
                // fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            _tasks.remove(task);

            Navigator.pop(context);
            notifyListeners();
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(
                color: Colors.white,
                // fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ],
          ),
        )
      ],
    ).show();
    
  }


}
