import 'package:app/Widgets/Home/HomeItem.dart';
import 'package:app/helpers/DotsIndicator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/goal.png",
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Level",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.green,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Text("1",
                        style: TextStyle(fontSize: 10, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DotsIndicator(currentIndex: 1, totalDots: 6),
            ],
          ),
        ),
        HomeItem(),
      ],
    );
  }
}
