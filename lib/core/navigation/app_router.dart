import 'package:betting_app/core/navigation/navigation_notifier.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_state.dart';
import 'package:betting_app/presentation/screen/auth_screens/registration_pages_screen.dart';
import 'package:betting_app/presentation/screen/home.dart';
import 'package:betting_app/presentation/screen/register_page.dart';
import 'package:betting_app/presentation/screen/setting_screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter(BuildContext context) {
  final navigationCubit = context.read<NavigationCubit>();

  return GoRouter(
    refreshListenable: NavigationNotifier(navigationCubit),
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => Home()),
      GoRoute(
          path: '/signup-page',
          builder: (context, state) => const RegisterPage()),
      GoRoute(
          path: '/create-account',
          builder: (context, state) => RegistrationPagesScreen()),
      GoRoute(path: '/setting-page', builder: (context, state) => Settings()),
    ],
    redirect: (context, state) {
      final navState = context.read<NavigationCubit>().state;
      if (navState is NavigationSignupPage) return '/signup-page';
      if (navState is NavigationCreateAccountPage) return '/create-account';
      if (navState is NavigationSettingPage) return '/setting-page';
      return '/'; //default alla Home
    },
  );
}
