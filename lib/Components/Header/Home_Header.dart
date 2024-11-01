import 'package:app/Components/Header/Feature.dart';
import 'package:app/Components/Header/Recent.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';

class Home_Header extends StatelessWidget {
  const Home_Header({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return SliverAppBar(
      pinned: true, // Bạn có thể bật hoặc tắt tùy theo nhu cầu
      expandedHeight: AppSizes.blockSizeHorizontal * 101,
      backgroundColor: Color(0xFF7C72E5),
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Recent(),
            Feature(),
          ],
        ),
      ),
    );
  }
}
