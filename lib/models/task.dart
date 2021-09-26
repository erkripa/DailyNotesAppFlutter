import 'package:flutter/cupertino.dart';

class Task {
  String? name;
  String? subname;
  bool? isDone;
  String? date;
  Task({
    @required this.name,
    this.subname,
    this.isDone = false,
    this.date,
  });

  void toggleDone() {
    isDone = !isDone!;
  }
}
