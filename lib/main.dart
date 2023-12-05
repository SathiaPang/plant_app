import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/onboard.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Must use always, and then start to write like that
      debugShowCheckedModeBanner: false,
      title: 'OnBoarding Screen ',
      home: OnBoardinScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Hello there",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Constants.primaryColor,
//       ),
//     );
//   }
// }
