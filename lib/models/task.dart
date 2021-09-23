import 'package:flutter/cupertino.dart';

class Task{
  String? name;
  String subname;
  bool? isDone;
  Task({@required this.name,this.subname="Task Descriptions..", this.isDone = false});

  void toggleDone(){
    isDone = !isDone!;
  }
}