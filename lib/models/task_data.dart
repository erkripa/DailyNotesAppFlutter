import 'package:daily_notes/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Buy Egg"),
    Task(name: "Buy Ornage"),
    Task(name: "Buy Apple"),
    Task(name: "Buy Banana"),
    Task(name: "Buy weryvery"),
  ];

  int get taskCount {
    return tasks.length;
  }
}
