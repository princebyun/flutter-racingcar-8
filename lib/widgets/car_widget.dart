import 'package:flutter/material.dart';

class CarWidget extends StatelessWidget {
  final String carName;
  final Color carColor;

  const CarWidget({Key? key, required this.carName, required this.carColor})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.directions_car_filled, color: carColor, size: 60),
        Text(
          carName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
