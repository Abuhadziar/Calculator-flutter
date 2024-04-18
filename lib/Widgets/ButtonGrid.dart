import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab_02/Model/buttons_logic.dart';
import 'package:lab_02/Widgets/ScientificPage.dart';
import 'package:lab_02/Widgets/TrigonometryPage.dart';
import 'package:lab_02/Widgets/HistoryPage.dart';

class TileButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? customColor;
  VoidCallback onPressed;

  TileButton({super.key, required this.text, required this.onPressed, this.width, this.customColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 80.0,
      height: 80.0,
      padding: const EdgeInsets.all(4),
      child: MaterialButton(
        onPressed: onPressed,
        color: customColor,
        textColor: Colors.black,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 22.0,
              color: Colors.black
          ),
        ),
      ),
    );
  }
}

class FunctionButton extends StatelessWidget {
  final IconData icon;
  final Color customColor;
  VoidCallback onPressed;

  FunctionButton({super.key, required this.icon, required this.onPressed, required this.customColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      padding: EdgeInsets.only(
        left: 4,
        right: 4,
        top: 8,
        bottom: 4,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Icon(icon),
        color: customColor,
        textColor: Colors.black,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class FunctionButtonColumn extends StatelessWidget {

  FunctionButtonColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FunctionButton(
          icon: FontAwesomeIcons.plus,
          onPressed: plusButtonClicked,
          customColor: Colors.white70,
        ),
        FunctionButton(
            icon: FontAwesomeIcons.minus,
            onPressed: minusButtonClicked,
            customColor: Colors.white70,
        ),
        FunctionButton(
            icon: FontAwesomeIcons.times,
            onPressed: multiplyButtonClicked,
            customColor: Colors.white70,
        ),
        FunctionButton(
            icon: FontAwesomeIcons.divide,
            onPressed: divButtonClicked,
            customColor: Colors.white70,
        ),
        FunctionButton(
            icon: FontAwesomeIcons.equals,
            onPressed: () {
              mathIsHard(displayMsg.value);
            },
            customColor: Colors.white70,
        ),
        SizedBox(height: 10),
        TileButton(
            text: 'C',
            onPressed: () {
              clearButtonClicked();
            },
            customColor: Colors.white70,
        ),
      ],
    );
  }
}

class ButtonGrid extends StatelessWidget {
  ButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                FunctionButton(
                    icon: FontAwesomeIcons.history,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryPage()),
                      );
                    },
                  customColor: Colors.teal,
                ),
                FunctionButton(
                  icon: FontAwesomeIcons.atom,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScientificPage()),
                    );
                  },
                  customColor: Colors.blueGrey
                ),
                FunctionButton(
                  icon: FontAwesomeIcons.rulerCombined,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrigonometryPage()),
                    );
                  },
                  customColor: Colors.blueGrey,
                )
              ],
            ),
            SizedBox(height: 78),
            Row(
              children: [
                for (var i = 1; i < 4; i++)
                    TileButton(
                      text: '$i',
                      onPressed: (){
                        numButtonClicked(i);
                      },
                      customColor: Colors.white70,
                    ),
              ],
            ),
            Row(
              children: [
                for (var i = 4; i < 7; i++)
                  TileButton(
                    text: '$i',
                    onPressed: () {
                      numButtonClicked(i);
                    },
                    customColor: Colors.white70,
                  ),
              ],
            ),
            Row(
              children: [
                for (var i = 7; i < 10; i++)
                  TileButton(
                    text: '$i',
                    onPressed: () {
                      numButtonClicked(i);
                    },
                    customColor: Colors.white70,
                  ),
              ],
            ),
            Row(
              children: [
                TileButton(
                  text: '0',
                  width: 70.0 * 3,
                  onPressed: () {
                    numButtonClicked(0);
                  },
                  customColor: Colors.white70,
                )
              ]
            )
          ]
        ),
        SizedBox(width: 45),
        FunctionButtonColumn()
      ],
    );
  }
}