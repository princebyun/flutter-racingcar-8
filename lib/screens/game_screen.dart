import 'package:flutter/material.dart';
import 'package:flutter_racingcar_8/logic/racing_logic.dart';
import 'package:flutter_racingcar_8/widgets/car_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameRound gameRound = GameRound();

  @override
  void initState() {
    super.initState();
    gameRound.setCars("자동차1,자동차2,자동차3");
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
    );
  }
}
