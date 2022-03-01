import 'package:flutter/material.dart';

class ToDo{
  String title ;
  bool isDone ;

  ToDo({
    required this.title,
    this.isDone = false
});
}