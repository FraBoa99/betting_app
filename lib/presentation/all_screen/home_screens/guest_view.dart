// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/data/constants/list_of_league.dart';
import 'package:betting_app/data/models/league.dart';
import 'package:betting_app/logic/cubit/betting_logic/matches_and_odds_cubit.dart';
import 'package:betting_app/logic/cubit/home/news_cubit.dart';
import 'package:betting_app/logic/cubit/home/sport_cubit.dart';
import 'package:betting_app/presentation/all_widget/widget/home/main_card.dart';
import 'package:betting_app/presentation/all_widget/widget/home/news_card.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class GuestView extends StatefulWidget {
  const GuestView({super.key});

  @override
  State<StatefulWidget> createState() => _GuestViewState();
}

class _GuestViewState extends State<GuestView> {
  final League defaultLeague = LeagueSoccer.serieA;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SportCubit>().selectedLeague(defaultLeague);
      context.read<NewsCubit>().fetchNews('sport');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 12),
            child: Text(
              'News',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
          ),
          Flexible(
            flex: 3,
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  return NewsCard(articles: state.articleList);
                } else {
                  return const Center(child: Text('Nessuna news disponibile'));
                }
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            flex: 8,
            child: BlocBuilder<BettingCubit, MatchesAndOddsState>(
              builder: (context, state) {
                if (state is MatchesAndOddsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MatchesAndOddsLoaded) {
                  return MainCard(oddsList: state.oddsList);
                } else if (state is MatchesAndOddsError) {
                  return const Center(
                      child: Text('Errore nel caricamento delle quote'));
                } else {
                  return const Center(child: Text('Nessun dato disponibile'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
