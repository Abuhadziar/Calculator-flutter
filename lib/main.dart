import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab_02/Widgets/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('Calculator'),
              SizedBox(width: 10.0),
              const Icon(FontAwesomeIcons.calculator),
            ],
          ),
        ),
        body: HomePage()
      ),
    );
  }
}

