import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final route = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}