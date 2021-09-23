import 'dart:collection';

import 'package:daily_notes/models/task.dart';
import 'package:flutter/Material.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String? newTaskTitle,String newSubTitle) {
    final task = Task(name: newTaskTitle,subname: newSubTitle);
    _tasks.add(task);
    
    notifyListeners();
  }

  void upDateTask (Task task){
    task.toggleDone();
    notifyListeners();

  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();

  }
}
