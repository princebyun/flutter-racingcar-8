import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_racingcar_8/logic/racing_logic.dart';
import 'package:flutter_racingcar_8/widgets/car_widget.dart';

class GameScreen extends StatefulWidget {
  final String userCarInput;

  const GameScreen({super.key, required this.userCarInput});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameRound gameRound = GameRound();
  final int finishLine = 15;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    gameRound.setCars(widget.userCarInput);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startRace() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        gameRound.carsMove();
      });
      bool isGameFinished = gameRound.carList.any(
        (car) => car.position >= finishLine,
      );

      if (isGameFinished) {
        timer.cancel();
        _showWinnerDialog();
      }
    });
  }

  void _showWinnerDialog() {
    String winners = gameRound.getWinners();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("경기 종료!"),
          content: Text("우승자는 $winners 입니다!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("확인"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (int i = 0; i < gameRound.carList.length; i++)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarWidget(
                      carName: gameRound.carList[i].name,
                      carColor: i % 2 == 0 ? Colors.red : Colors.blue,
                    ),
                    SizedBox(height: gameRound.carList[i].position * 50.0 + 50),
                  ],
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              startRace();
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.play_arrow),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
