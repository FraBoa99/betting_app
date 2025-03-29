// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Menù',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            text: 'Impostazioni',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.info,
            text: 'Informazioni',
            onTap: () {
              //  Navigator.of(context).pushNamed(AppRoutes.about);
            },
          ),
          _buildDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onTap: () async {
              context.read<AuthCubit>().signOut();
            },
          ),
        ],
      ),
    );
  }

  /// 🔹 Metodo per costruire un ListTile standard per il menu
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
