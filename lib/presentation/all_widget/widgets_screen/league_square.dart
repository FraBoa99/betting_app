// 🐦 Flutter imports:
import 'package:betting_app/core/config/theme/app_colors.dart';
import 'package:betting_app/logic/cubit/home/sport_cubit.dart';
import 'package:betting_app/logic/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// 📦 Package imports:
import 'package:flutter_svg/svg.dart';

class LeagueWidget extends StatefulWidget {
  final String leagueKey;
  final String leagueFlag;

  const LeagueWidget({
    super.key,
    required this.leagueKey,
    required this.leagueFlag,
  });

  @override
  State<StatefulWidget> createState() => _LeagueWidgetState();
}

class _LeagueWidgetState extends State<LeagueWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportCubit, SportState>(builder: (context, state) {
      return Container(
        width: dynamicScale(context, 85, null),
        height: dynamicScale(context, null, 85),
        decoration: BoxDecoration(
            color: state.selectedLeague.key == widget.leagueKey
                ? AppColors.bgCircleLegaSelected
                : AppColors.bgCircleLega,
            shape: BoxShape.circle),
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              widget.leagueFlag,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    });
  }
}
