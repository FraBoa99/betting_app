// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class BetOddTitle extends StatelessWidget {
  final String label;
  final double odd;

  const BetOddTitle({
    super.key,
    required this.label,
    required this.odd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 51,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 3,
          ),
          Text(odd.toString(),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}
