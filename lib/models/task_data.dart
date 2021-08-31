import 'dart:collection';

import 'package:daily_notes/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Buy Egg"),
    Task(name: "Buy Ornage"),
    Task(name: "Buy Apple"),
    Task(name: "Buy Banana"),
    Task(name: "Buy weryvery"),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
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
