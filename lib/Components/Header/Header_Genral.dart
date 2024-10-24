import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Info extends StatelessWidget {
  final bool check;
  final bool check_name;
  const Info({super.key, required this.check, required this.check_name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF7C72E5),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/morning.png",
                        width: 20,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "GOOD MORNING",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFD6DD),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    check_name ? "Madelyn Dias" : "Your Profile",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
              if (check)
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/images/users/avatar.jpg'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
