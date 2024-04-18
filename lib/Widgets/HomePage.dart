import 'package:flutter/material.dart';
import 'package:lab_02/Widgets/ButtonGrid.dart';
import 'package:lab_02/Widgets/Display.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height - 140,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
            children: [
              Display(),
              ButtonGrid()
            ]
      ),
    );
  }
}