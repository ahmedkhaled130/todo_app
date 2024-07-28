import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';

class HomeScreen extends StatelessWidget {
static const String routeName="HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do List"),),
    );
  }
}
