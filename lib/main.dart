import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Must use always, and then start to write like that
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello there",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
