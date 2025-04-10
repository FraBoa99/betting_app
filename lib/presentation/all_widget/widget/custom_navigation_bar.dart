// 🐦 Flutter imprts:
// 🌎 Project imports:
import 'package:betting_app/core/config/theme/app_colors.dart';
import 'package:betting_app/logic/cubit/navigation/bottom_nav_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

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
        padding: const EdgeInsets.only(bottom: 35, left: 25, right: 25),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(90)),
          child: Container(
            width: 90,
            height: 85,
            color: AppColors.bgMainContainer,
            child: Row(
              spacing: 15,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildIcon(Icons.home_outlined, 0, selectedIndex),
                _buildIcon(Icons.home, 1, selectedIndex),
                _buildIcon(
                    Icons.confirmation_number_outlined, 2, selectedIndex),
                _buildIcon(Icons.person_2_outlined, 3, selectedIndex),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildIcon(IconData icon, int index, int selectedIndex) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (index) {
            case 0:
              context.read<NavigationCubit>().navigateToWrappedHome();
            case 1:
              context.read<NavigationCubit>().navigateToWrappedHome();
            case 2:
              context.read<NavigationCubit>().navigateToWrappedHome();
            case 3:
              context.read<NavigationCubit>().navigateToProfile();
          }
        });
      },
      child: Container(
        height: 70,
        width: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.bgCircleIcon : Colors.transparent,
        ),
        child: Center(
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 94, 94, 96),
            size: 37,
          ),
        ),
      ),
    );
  }
}
