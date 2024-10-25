import 'package:flutter/material.dart';
import 'package:app/Definitons/Color.dart';
import 'package:app/helpers/DotsIndicator.dart';

class LevelHome extends StatefulWidget {
  const LevelHome({super.key});

  @override
  _LevelHome createState() => _LevelHome();
}

class _LevelHome extends State<LevelHome> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/home/goal.png",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  "Level",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16, // Kích thước chữ rõ ràng hơn
                    color: sectionColors[
                        'textPrimary'], // Màu sắc có thể tùy chỉnh
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: sectionColors['sidebar'], // Màu cho level box
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 10,
                      color: sectionColors['bg_white'],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DotsIndicator(
              currentIndex: 0,
              totalDots: 6,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
