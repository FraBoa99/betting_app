// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class SportSquare extends StatelessWidget {
  final String sportName;

  const SportSquare({
    super.key,
    required this.sportName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(sportName,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
