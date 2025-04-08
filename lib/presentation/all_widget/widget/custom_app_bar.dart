// 🐦 Flutter imports:
import 'package:betting_app/core/config/theme/app_colors.dart';
import 'package:betting_app/logic/utils/size_utils.dart';
import 'package:flutter/material.dart';

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
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: dynamicScale(context, 120, null),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          constraints: const BoxConstraints(minHeight: 677),
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
                    color: Colors.black,
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
