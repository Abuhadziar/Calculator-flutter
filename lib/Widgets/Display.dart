import 'package:flutter/material.dart';
import 'package:lab_02/Model/buttons_logic.dart';

class Display extends StatelessWidget {

  Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: screenSize.width - 8,
          height: 100,
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 20,
            ),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ValueListenableBuilder<String>(
              valueListenable: displayMsg,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white70,
                  )
                );
              }

            ),
          ),
        ),
      ],
    );
  }
}