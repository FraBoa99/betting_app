// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// 🌎 Project imports:
import 'package:betting_app/constants/assets/assets.dart';
import 'package:betting_app/logic/cubit/navigation/bottom_nav_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(builder: (context, selectedIndex) {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 26, 25, 25),
              Color.fromARGB(255, 9, 9, 9),
              Color.fromARGB(255, 26, 25, 25),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<BottomNavCubit>().setIndex(index);

              if (index != selectedIndex) {
                switch (index) {
                  case 0:
                    context.read<NavigationCubit>().navigateToWrappedHome();
                  case 1:
                    context.read<NavigationCubit>().navigateToSignupPage();
                  case 2:
                    print('ciao');
                  case 3:
                    context.read<NavigationCubit>().navigateToSettings();
                }
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 31.0,
                    height: 31.0,
                    child: SvgPicture.asset(
                      selectedIndex == 0
                          ? Assets.iconHomeSelected
                          : Assets.iconHome,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  selectedIndex == 1
                      ? Assets.iconProfileSelected
                      : Assets.iconProfile,
                  width: 31.0,
                  height: 31.0,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  selectedIndex == 2
                      ? Assets.iconCartSelected
                      : Assets.iconCart,
                  width: 31.0,
                  height: 31.0,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  selectedIndex == 3
                      ? Assets.iconMenuSelected
                      : Assets.iconMenu,
                  width: 31.0,
                  height: 31.0,
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    });
  }
}
