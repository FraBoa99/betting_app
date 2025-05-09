import 'package:betting_app/data/models/bookmakers_api.dart';
import 'package:betting_app/data/models/odds.dart';
import 'package:betting_app/logic/utils/format_data.dart';
import 'package:betting_app/presentation/all_widget/widget_menu/league_menu.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MainCard extends StatefulWidget {
  final List<Odds> oddsList;

  const MainCard({super.key, required this.oddsList});

  @override
  State<StatefulWidget> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 18, bottom: 18, left: 1),
      decoration: const BoxDecoration(
        color: Color.fromARGB(0, 255, 255, 255),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        spacing: 20,
        children: [
          const LeagueMenu(), // Menu delle leghe
          if (widget.oddsList.isNotEmpty)
            Flexible(
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemCount: widget.oddsList.length,
                separatorBuilder: (_, __) => const SizedBox(),
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
        bookmaker?.market.isNotEmpty == true ? bookmaker?.market.first : null;
    final homeOdd = market?.outcomes.firstWhere((o) => o.name == odd.homeTeam);
    final awayOdd = market?.outcomes.firstWhere((o) => o.name == odd.awayTeam);
    final Outcomes? drawOdd = market?.outcomes.firstWhereOrNull(
      (o) => o.name == 'Draw',
    );

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  spacing: 40,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        odd.homeTeam,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const Text(
                      "-",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        odd.awayTeam,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                formatDateTime(odd.commenceTime),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const Spacer(),
            // Quote della partita
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 8, right: 8),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  spacing: 9,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildOddButton(homeOdd?.price ?? 0),
                    if (drawOdd != null)
                      _buildOddButton(drawOdd.price, isDraw: true),
                    _buildOddButton(awayOdd?.price ?? 0),
                  ],
                ),
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
