import 'package:flutter/material.dart';
import 'bet_odd_title.dart';

class BetEventOddsListTitle extends StatelessWidget {
  final String team1;
  final String team2;
  final Icon? icon;
  final String tournament;
  final String date;
  final double? odd1;
  final double? oddX;
  final double? odd2;

  const BetEventOddsListTitle({
    super.key,
    required this.team1,
    required this.team2,
    required this.tournament,
    required this.date,
    this.icon,
    this.odd1,
    this.oddX,
    this.odd2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: ListTile(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tournament),
              Text(team1, style: Theme.of(context).textTheme.headlineSmall),
              Text(team2, style: Theme.of(context).textTheme.headlineSmall),
              Text(date)
            ],
          ),
          Row(
            children: [
              BetOddTitle(label: '1', odd: odd1 ?? 1.00),
              const SizedBox(width: 4),
              if (oddX != null) BetOddTitle(label: 'X', odd: oddX ?? 1.0),
              const SizedBox(width: 4),
              BetOddTitle(label: '2', odd: odd2 ?? 1.00)
            ],
          ),
        ]),
      ),
    );
  }
}
