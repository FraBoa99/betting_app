import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeagueSquare extends StatelessWidget {
  final String leagueName;
  final String leagueFlag;

  const LeagueSquare({
    super.key,
    required this.leagueName,
    required this.leagueFlag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            leagueFlag,
            width: 23,
            height: 23,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(leagueName,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
