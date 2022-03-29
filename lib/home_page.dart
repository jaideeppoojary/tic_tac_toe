import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  todo: linking images
  AssetImage cross = const AssetImage("images/cross.png");
  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage edit = const AssetImage("images/edit.png");

  bool isCross = true;
  late String message;
  late List<String> gameState;

  //getting image
  AssetImage getImage(String imageValue) {
    if (imageValue == 'cross') {
      return cross;
    } else if (imageValue == 'circle') {
      return circle;
    } else {
      return edit;
    }
  }

  // todo: initialising state of box with empty
  @override
  void initState() {
    super.initState();

    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
      message = "";
    });
  }

  // todo: play game method
  playGame(int index) {
    if (gameState[index] == "empty") {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }

        isCross = !isCross;
        setState(() {
          message = checkWin();
        });
        if (message != "") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: const [
                  Icon(Icons.restore_outlined),
                  SizedBox(width: 5.0),
                  Text("Restting Game in 5 Second"),
                ],
              ),
              behavior: SnackBarBehavior.floating,
              padding: const EdgeInsets.all(10.0),
            ),
          );
          Timer(const Duration(seconds: 5), () {
            resetGame();
          });
        }
      });
    }
  }

  // todo: Reset game method
  resetGame() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
      message = "";
    });
  }

  // todo: check for winning logic
  String checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      return '${gameState[0]} wins.';
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      return '${gameState[3]} wins.';
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      return '${gameState[6]} wins.';
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      return '${gameState[0]} wins.';
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      return '${gameState[2]} wins.';
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      return '${gameState[0]} wins.';
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      return '${gameState[1]} wins.';
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      return '${gameState[2]} wins.';
    } else if (!gameState.contains('empty')) {
      return 'Game Draw!';
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'),
        backgroundColor: Color(0xFF516360),
      ),
      backgroundColor: Color(0xff6D9387),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GridView.builder(
                padding: const EdgeInsets.all(30.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      playGame(i);
                    },
                    child: Image(
                      image: getImage(gameState[i]),
                    ),
                    color: const Color(0xFFCEDBD8),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              " $message",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              minWidth: 300.0,
              height: 50.0,
              onPressed: resetGame,
              color: const Color(0xffD3C687),
              child: const Text(
                "Reset Game",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: const Text(
              " Designed By Jaideep.",
              style: TextStyle(fontSize: 13.0),
            ),
          ),
        ],
      ),
    );
  }
}
