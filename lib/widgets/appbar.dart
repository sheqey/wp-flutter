import 'package:flutter/material.dart';

class Appba extends StatelessWidget implements PreferredSizeWidget {
  const Appba({super.key});

  @override
  Widget build(BuildContext context) {
    return   AppBar(
      title: const Text('Switch News'),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(35);

}
