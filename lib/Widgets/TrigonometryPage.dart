import 'package:flutter/material.dart';
import 'package:lab_02/Model/buttons_logic.dart';
import 'package:lab_02/Widgets/ButtonGrid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab_02/Widgets/Display.dart';
import 'package:lab_02/Widgets/HistoryPage.dart';
import 'package:lab_02/Widgets/ScientificPage.dart';

int counterSin = 0;
int counterCos = 0;
int counterTan = 0;
int counterCtg = 0;

class TrigonometryPage extends StatefulWidget {
  const TrigonometryPage({Key? key}) : super(key: key);

  @override
  _TrigonometryPageState createState() => _TrigonometryPageState();
}

class _TrigonometryPageState extends State<TrigonometryPage> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Calculator'),
            SizedBox(width: 10.0),
            const Icon(FontAwesomeIcons.calculator),
          ],
        ),
      ),
      body: Container(
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
              ScientificButtonGrid()
            ]
        ),
      ),
    );
  }
}

@override
class FunctionButtonColumn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileButton(
          text: 'Sin',
          onPressed: () {
            sinButtonClicked(counterSin) ;
            counterSin++;
          },
          customColor: Colors.white70,
        ),
        TileButton(
            text: 'Cos',
            onPressed: () {
              cosButtonClicked(counterCos) ;
              counterCos++;
            },
            customColor: Colors.white70
        ),
        TileButton(
            text: 'Tan',
            onPressed: () {
              tanButtonClicked(counterTan) ;
              counterTan++;
            },
            customColor: Colors.white70
        ),
        TileButton(
            text: 'Ctg',
            onPressed: () {
              ctgButtonClicked(counterCtg) ;
              counterCtg++;
            },
            customColor: Colors.white70
        ),
        FunctionButton(
            icon: FontAwesomeIcons.equals,
            onPressed: () {
              mathIsHard(displayMsg.value);
            },
            customColor: Colors.white70
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

class ScientificButtonGrid extends StatelessWidget {
  const ScientificButtonGrid({Key? key}) : super(key: key);
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
                          MaterialPageRoute(builder: (context) => HistoryPage(),
                          )
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
                      icon: FontAwesomeIcons.plusCircle,
                      onPressed: () {
                        Navigator.pop(context);
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
                        onPressed: (){
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
                        onPressed: (){
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
        ]
    );
  }
}