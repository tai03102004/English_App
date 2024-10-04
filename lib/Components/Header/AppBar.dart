import 'package:app/Definitons/Color.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: sectionColors['header'],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
