// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:betting_app/core/navigation/navigation_notifier.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_state.dart';
import 'package:betting_app/presentation/all_screen/home_screens/home_screen.dart';
import 'package:betting_app/presentation/all_screen/registration_screens/guest_profile_page.dart';
import 'package:betting_app/presentation/all_screen/registration_screens/registration_pages_screen.dart';
import 'package:betting_app/presentation/all_screen/setting_screens/settings.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter(BuildContext context) {
  final navigationCubit = context.read<NavigationCubit>();

  return GoRouter(
    refreshListenable: NavigationNotifier(navigationCubit),
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(
          path: '/signup-page',
          builder: (context, state) => const GuestProfilePage()),
      GoRoute(
          path: '/create-account',
          builder: (context, state) => const RegistrationPagesScreen()),
      GoRoute(path: '/setting-page', builder: (context, state) => Settings()),
    ],
    redirect: (context, state) {
      final navState = context.read<NavigationCubit>().state;
      if (navState is NavigationSignupPage) return '/signup-page';
      if (navState is NavigationCreateAccountPage) return '/create-account';
      if (navState is NavigationSettingPage) return '/setting-page';
      if (navState is NavigationWrappedHome) return '/';
      return '/'; //default alla Home
    },
  );
}
