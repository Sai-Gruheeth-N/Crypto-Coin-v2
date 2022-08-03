import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      shadowColor: Colors.grey[600],
      centerTitle: true,
      title: const Text(
        'CryptoCoin',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// leading: Padding(
//   padding: const EdgeInsets.all(5.0),
//   child: IconButton(
//     onPressed: () {},
//     icon: const Icon(
//       Icons.account_circle,
//       color: Colors.teal,
//       size: 30,
//     ),
//   ),
// ),