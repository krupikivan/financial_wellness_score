import 'package:flutter/material.dart';

import 'main_logo.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const SizedBox.shrink(),
      title: const MainLogo(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
