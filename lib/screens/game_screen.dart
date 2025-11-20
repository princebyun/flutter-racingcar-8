import 'package:flutter/material.dart';
import 'package:flutter_racingcar_8/widgets/car_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            left: 100,
            bottom: 50,
            child: CarWidget(name: "페라리", carColor: Colors.blue),
          ),
        ],
      ),
    );
  }
}
