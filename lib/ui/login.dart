import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
