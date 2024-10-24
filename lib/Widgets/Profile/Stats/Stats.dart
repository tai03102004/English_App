import 'package:app/Definitons/size_config.dart';
import 'package:app/Middlewares/Circle_Percent.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Stats createState() => _Stats();
}

class _Stats extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Column(
      children: [
        Column(
          children: [
            Text(
              "You have played a total",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  "24 quizzes ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A5AE0),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "this month!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: CirclePercent(
            text: '37',
            radius: 100.0,
            lineWidth: 12.0,
            percent: 0.65,
            fontSize: 32.0,
            check: true,
          ),
        ),
        Row(
          children: [
            ItemContainer(
              number: '5',
              subtitle: 'Quiz Created',
              image: 'assets/images/profiles/pen.png',
              color: Colors.white,
              check: true,
            ),
            SizedBox(
              width: 15,
            ),
            ItemContainer(
              number: '21',
              subtitle: 'Quiz Won',
              image: 'assets/images/profiles/won.png',
              color: Color(0xFF6A5AE0),
              check: false,
            ),
          ],
        )
      ],
    );
  }
}

class ItemContainer extends StatelessWidget {
  final String number;
  final String subtitle;
  final String image;
  final Color color;
  final bool check;

  const ItemContainer({
    required this.number,
    required this.subtitle,
    required this.image,
    required this.color,
    required this.check,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    final textColor = check ? Colors.black : Colors.white;

    return Container(
      width: AppSizes.screenWidth * 0.35,
      height: AppSizes.screenHeight * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                image,
                width: 24,
                height: 24,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
