import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFFFB3C0),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "RECENT QUIZ",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(161, 102, 0, 19),
                ),
              ),
              Row(
                children: [
                  Image.asset("assets/images/headphone.png"),
                  SizedBox(width: 4),
                  Text(
                    "A Basic Music Quiz",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF660012),
                    ),
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          CircularPercentIndicator(
            radius: 25.0,
            lineWidth: 12.0,
            animation: true,
            percent: 0.65, // 65%
            center: Text(
              "65%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.pinkAccent,
            backgroundColor: Colors.pink.shade100,
          ),
        ],
      ),
    );
  }
}
