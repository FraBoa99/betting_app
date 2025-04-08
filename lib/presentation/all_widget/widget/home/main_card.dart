import 'package:betting_app/data/models/odds.dart';
import 'package:betting_app/logic/utils/size_utils.dart';
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
        spacing: 17,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 175.0),
            child: Divider(
              thickness: 4,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Calcio',
                style: TextStyle(
                    fontFamily: "Playfair Display",
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
            ),
          ),
          const LeagueMenu(), // Menu delle leghe
          if (widget.oddsList.isNotEmpty)
            SizedBox(
              height: dynamicScale(context, null, 190),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.oddsList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final odd = widget.oddsList[index];
                  return _buildMatchCard(odd);
                },
              ),
            ),
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

    return SizedBox(
      width: dynamicScale(context, 400, null),
      height: dynamicScale(context, null, 250),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 1,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          odd.homeTeam,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "-",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          odd.awayTeam,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )),
            const Spacer(),

            // Quote della partita
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        backgroundColor: const Color(0xFFF6F8FA),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(' ${odd.toStringAsFixed(2)}',
          style: const TextStyle(color: Colors.black)),
    );
  }
}
