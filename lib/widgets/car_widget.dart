import 'package:flutter/material.dart';

class CarWidget extends StatelessWidget {
  final String name;
  final Color carColor;

  const CarWidget({Key? key, required this.name, required this.carColor})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.directions_car_filled, color: carColor, size: 60),
        Text(
          name,
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
