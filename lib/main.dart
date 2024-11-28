import 'package:betting_app/bloc/navigation/navigation_cubit.dart';
import 'package:betting_app/bloc/rest/betting_cubit.dart';
import 'package:betting_app/bloc/settings/theme_cubit.dart';
import 'package:betting_app/bloc/ui/sport_cubit.dart';
import 'package:betting_app/core/navigation/app_routes.dart';
import 'package:betting_app/repository/odds_repository.dart';
import 'package:betting_app/screen/home.dart';
import 'package:betting_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = OddsRepository(apiClient: ApiService());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => BettingCubit(repository: repository)),
        BlocProvider(
          create: (context) =>
              SportCubit(context.read<BettingCubit>(), repository: repository),
        ),
        BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, theme) {
        return MaterialApp(
          initialRoute: AppRoutes.home,
          onGenerateRoute: AppRoutes.generateRoute,
          title: 'Flutter Demo',
          theme: theme,
          home: Home(),
        );
      }),
    );
  }
}
