import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/core/services.dart';
import 'package:tic_tac_toe/provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool oturn = true;
  // var resultdecleration = '';
  // int fillBoxes = 0;
  // var xValue = 0;
  // var oValue = 0;
  // bool winnerfound = false;
  // List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<CounterProvider>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player 0',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Player X',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value.oValue.toString(),
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Text(
                            value.xValue.toString(),
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )),
                  Expanded(
                      flex: 4,
                      child: GridView.builder(
                          itemCount: 9,
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0),
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              onTap: () {
                                value.call(context, index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber),
                                child: Center(
                                    child: Text(
                                  value.displayXO[index],
                                  style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            );
                          })),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      value.resultdecleration,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // void ontapped(int index) {
  //   setState(() {
  //     if (!winnerfound && displayXO[index] == '') {
  //       if (oturn) {
  //         displayXO[index] = 'O';
  //         fillBoxes++;
  //       } else {
  //         displayXO[index] = 'X';
  //         fillBoxes++;
  //       }
  //       oturn = !oturn;
  //       checkwinner();
  //     }
  //   });
  // }

  // void checkwinner() {
  //   //first row
  //   if (displayXO[0] == displayXO[1] &&
  //       displayXO[0] == displayXO[2] &&
  //       displayXO[0] != '') {
  //     setState(() {
  //       resultdecleration = 'player  ${displayXO[0]}wins';
  //       _updatedscore(displayXO[0]);
  //     });
  //   }
  //   //second row
  //   if (displayXO[3] == displayXO[4] &&
  //       displayXO[3] == displayXO[5] &&
  //       displayXO[3] != '') {
  //     setState(() {
  //       resultdecleration = 'player   ${displayXO[3]} wins';
  //       _updatedscore(displayXO[3]);
  //     });
  //   }
  //   // third row
  //   if (displayXO[6] == displayXO[7] &&
  //       displayXO[6] == displayXO[8] &&
  //       displayXO[6] != '') {
  //     setState(() {
  //       resultdecleration = 'player ${displayXO[6]} wins';
  //       _updatedscore(displayXO[6]);
  //     });
  //   }
  //   //first column
  //   if (displayXO[0] == displayXO[3] &&
  //       displayXO[0] == displayXO[6] &&
  //       displayXO[0] != '') {
  //     setState(() {
  //       resultdecleration = 'player ${displayXO[0]} wins';
  //       _updatedscore(displayXO[0]);
  //     });
  //   }
  //   //second column
  //   if (displayXO[1] == displayXO[4] &&
  //       displayXO[1] == displayXO[5] &&
  //       displayXO[1] != '') {
  //     setState(() {
  //       resultdecleration = 'player ${displayXO[1]} wins';
  //       _updatedscore(displayXO[1]);
  //     });
  //   }
  //   //third column
  //   if (displayXO[2] == displayXO[5] &&
  //       displayXO[2] == displayXO[8] &&
  //       displayXO[2] != '') {
  //     setState(() {
  //       resultdecleration = 'player ${displayXO[2]} wins';
  //       _updatedscore(displayXO[2]);
  //     });
  //   }
  //   //first diagle
  //   if (displayXO[0] == displayXO[4] &&
  //       displayXO[0] == displayXO[8] &&
  //       displayXO[0] != '') {
  //     setState(() {
  //       resultdecleration = 'player ${displayXO[0]} wins';
  //       _updatedscore(displayXO[0]);
  //     });
  //   }
  //   //second diagle
  //   if (displayXO[6] == displayXO[4] &&
  //       displayXO[6] == displayXO[2] &&
  //       displayXO[6] != '') {
  //     setState(() {
  //       resultdecleration = 'player ${displayXO[6]} wins';
  //       _updatedscore(displayXO[6]);
  //     });
  //   }
  //   if (!winnerfound && fillBoxes == 9) {
  //     setState(() {
  //       resultdecleration = 'No body Win';
  //     });
  //   }
  // }

  // void _updatedscore(String winner) {
  //   if (winner == 'O') {
  //     oValue++;
  //   } else if (winner == 'X') {
  //     xValue++;
  //   }
  //   winnerfound = true;
  //   _showResultDialog('The match is over, and Player $winner won the match!');
  // }

  // void _showResultDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Game Over'),
  //         content: Text(message),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               _resetGame();
  //               Navigator.pop(context);
  //             },
  //             child: const Text('Reset'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _resetGame() {
  //   setState(() {
  //     oturn = true;
  //     resultdecleration = '';
  //     fillBoxes = 0;
  //     winnerfound = false;
  //     displayXO = ['', '', '', '', '', '', '', '', ''];
  //   });
  // }
}
