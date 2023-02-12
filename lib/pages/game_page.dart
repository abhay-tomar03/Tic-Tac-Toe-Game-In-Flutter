// ignore_for_file: unnecessary_import, implementation_imports

import 'dart:developer';
import 'package:flutter/material.dart';


import 'package:flutter/src/widgets/framework.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int scoreX = 0;
  int scoreO = 0;
  bool turnOfO = false;
  // ignore: non_constant_identifier_names
  String PlayersChoice = '';
  String opponent = '';
  int filledBoxes = 0;
  List<String> xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    String choice = ModalRoute.of(context)!.settings.arguments as String;
    log(choice);
    if (choice == 'X') {
      PlayersChoice = 'X';
      opponent = 'O';
    } else if (choice == 'O') {
      PlayersChoice = 'O';
      opponent = 'X';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe',
            style: TextStyle(fontFamily: 'edu', fontSize: 40)),
        backgroundColor: const Color(0xFFff4b4b),
        actions: [
          IconButton(
            onPressed: () {
              clearBoard();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(235, 16, 53, 66),
      body: Column(
        children: [
          buildPointsTable(),
          buildGrid(),
          buildTurn(),
        ],
      ),
    );
  }

  // Build Grid 
  Widget buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
        itemCount: xOrOList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              tappedIndex(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Center(
                child: Text(
                  xOrOList[index],
                  style: TextStyle(
                    color: xOrOList[index] == "X" ? Colors.yellow : Colors.pink,
                    fontSize: 40,
                    fontFamily: 'edu',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

// Tapping the index
  void tappedIndex(int index) {
    setState(
      () {
        if (turnOfO && xOrOList[index] == '') {
          xOrOList[index] = 'O';
          filledBoxes += 1;
        } else if (!turnOfO && xOrOList[index] == '') {
          xOrOList[index] = 'X';
          filledBoxes += 1;
        }
        turnOfO = !turnOfO;
        checkWinner();
      },
    );
  }

// Building the user's turn
  Widget buildTurn() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        turnOfO ? 'Turn Of O' : 'Turn of X',
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'edu',
          fontSize: 25,
        ),
      ),
    );
  }

// Clear the board
  void clearBoard() {
    setState(
      () {
        for (var i = 0; i < xOrOList.length; i++) {
          xOrOList[i] = '';
        }
      },
    );
    filledBoxes = 0;
  }

// Build The points table
  Widget buildPointsTable() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Your Choice : $PlayersChoice',
                  style: const TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontFamily: 'edu',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  PlayersChoice == 'X' ? scoreX.toString() : scoreO.toString(),
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontFamily: 'edu',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Opponent : $opponent',
                  style: const TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontFamily: 'edu',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  opponent == 'O' ? scoreO.toString() : scoreX.toString(),
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontFamily: 'edu',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Check winner
  void checkWinner() {
    // Checking first row
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You win', xOrOList[0]);
      return;
    }

    // checking second row
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      showWinDialog(context, 'You win', xOrOList[3]);
      return;
    }

    // checking third row
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      showWinDialog(context, 'You win', xOrOList[6]);
      return;
    }

    // checking first column
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You win', xOrOList[0]);
      return;
    }

    // checking second column
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      showWinDialog(context, 'You win', xOrOList[1]);
      return;
    }

    // checking third column
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      showWinDialog(context, 'You win', xOrOList[2]);
      return;
    }

    // Checking diagonally

    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You Win', xOrOList[0]);
      return;
    }

    // Chceking diagonnaly

    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      showWinDialog(context, 'You win', xOrOList[2]);
      return;
    }

    if (filledBoxes == 9) {
      showWinDialog(context, 'Its A Draw', '');
      // return
    }
  }

  // Show winning or draw dialog
  Future<void> showWinDialog(
    BuildContext context,
    String title,
    String winner,
  ) {
    if (winner == 'O') {
      scoreO += 1;
    } else {
      scoreX += 1;
    }
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: winner == ''
              ? const Text('The Match ended in a Draw')
              : Text(
                  'The Winner is ${winner.toUpperCase()}',
                ),
          actions: [
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text('Retry'),
            ),
          ],
        );
      },
    );
  }
}
