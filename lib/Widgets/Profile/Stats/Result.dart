// ignore: file_names
import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Container(
      padding: EdgeInsets.all(16),
      width: AppSizes.screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF6A5AE0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: StatItem(
                image: "assets/images/users/star.png",
                title: "POINTS",
                value: "590"),
          ),
          Container(
            height: 69,
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
          ),
          Expanded(
            flex: 1,
            child: StatItem(
                image: "assets/images/users/world.png",
                title: "WORLD RANK",
                value: "#1,438"),
          ),
          Container(
            height: 69,
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
          ),
          Expanded(
            flex: 1,
            child: StatItem(
                image: "assets/images/users/rank.png",
                title: "LOCAL RANK",
                value: "#56"),
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String title;
  final String value;
  final String image;

  StatItem({required this.title, required this.value, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 24,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 12,
              color: const Color.fromARGB(161, 255, 255, 255),
              fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
