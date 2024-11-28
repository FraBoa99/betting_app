import 'package:flutter/material.dart';

class SportSquare extends StatelessWidget {
  final String sportName;

  const SportSquare({
    super.key,
    required this.sportName,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 80,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(
            //   child: SvgPicture.asset(
            //     //sportsAssets[sportName] ?? '-',
            //     width: 24,
            //     height: 24,
            //   ),
            // ),//Da ripristinare dopo aver aggiunto gli assets
            const SizedBox(
              height: 10,
            ),
            Text(sportName,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 3,
            )
          ],
        ),
      ),
    );
  }
}
