import 'package:betting_app/data/models/odds.dart';
import 'package:betting_app/presentation/all_widget/widget_menu/league_menu.dart';
import 'package:flutter/material.dart';

class MainCard extends StatefulWidget {
  final List<Odds> oddsList;

  const MainCard({super.key, required this.oddsList});

  @override
  State<StatefulWidget> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.54,
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        spacing: 25,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Calcio',
              style: TextStyle(
                  fontFamily: "Playfair Display",
                  fontWeight: FontWeight.w700,
                  fontSize: 23),
            ),
          ),
          const LeagueMenu(), // Menu delle leghe
          if (widget.oddsList.isNotEmpty)
            Expanded(child: _buildMatchCard(widget.oddsList.first)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          )
        ],
      ),
    );
  }

  Widget _buildMatchCard(Odds odd) {
    final bookmaker = odd.bookmakers.isNotEmpty ? odd.bookmakers.first : null;
    final market =
        bookmaker?.market.isNotEmpty == true ? bookmaker!.market.first : null;
    final homeOdd = market?.outcomes.firstWhere((o) => o.name == odd.homeTeam);
    final awayOdd = market?.outcomes.firstWhere((o) => o.name == odd.awayTeam);
    final drawOdd = market?.outcomes.firstWhere((o) => o.name == 'Draw');

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 1,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(odd.homeTeam,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text("VS",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(odd.awayTeam,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),

            // Quote della partita
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOddButton(homeOdd?.price ?? 0),
                  _buildOddButton(drawOdd?.price ?? 0, isDraw: true),
                  _buildOddButton(awayOdd?.price ?? 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOddButton(double odd, {bool isDraw = false}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isDraw ? Colors.orange : Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(odd.toStringAsFixed(2),
          style: const TextStyle(color: Colors.white)),
    );
  }
}
