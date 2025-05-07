// 🐦 Flutter imports:
import 'package:betting_app/core/config/theme/app_colors.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<StatefulWidget> createState() => _CustomAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBar extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: dynamicScale(context, 120, null),
        actions: [
          IconButton(
              onPressed: () {
                context
                    .read<NavigationCubit>()
                    .navigateToProfileIfAuthenticated();
              },
              icon: const Icon(
                Icons.person,
                size: 35,
              ))
        ],
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                blurRadius: 6,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('20.00£'),
              SizedBox(width: dynamicScale(context, 15, null)),
              GestureDetector(
                onTap: () {
                  // Azione per ricaricare il saldo
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.bgCircleIcon,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
