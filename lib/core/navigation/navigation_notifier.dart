// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';

class NavigationNotifier extends ChangeNotifier {
  final NavigationCubit navigationCubit;

  NavigationNotifier(this.navigationCubit) {
    navigationCubit.stream.listen((_) {
      notifyListeners(); // Notifica GoRouter quando cambia lo stato
    });
  }
}
