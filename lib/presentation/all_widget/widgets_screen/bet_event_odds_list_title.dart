// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'bet_odd_title.dart';

class BetEventOddsListTitle extends StatelessWidget {
  final String team1;
  final String team2;
  final Icon? icon;
  final String tournament;
  final DateTime? date;
  final double? odd1;
  final double? oddX;
  final double? odd2;

  const BetEventOddsListTitle({
    super.key,
    required this.team1,
    required this.team2,
    required this.tournament,
    this.date,
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(team1,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              Text(team2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              Text(
                DateFormat('HH:mm, d MMMM').format(date ?? DateTime.now()),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              BetOddTitle(label: '1', odd: odd1 ?? 1.00),
              const SizedBox(width: 10),
              if (oddX != null) BetOddTitle(label: 'X', odd: oddX ?? 1.0),
              const SizedBox(width: 10),
              BetOddTitle(label: '2', odd: odd2 ?? 1.00)
            ],
          ),
        ]),
      ),
    );
  }
}
