import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';

class Feature extends StatelessWidget {
  const Feature({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    // Các giá trị thường dùng
    const EdgeInsets containerPadding = EdgeInsets.all(25);
    const EdgeInsets containerMargin = EdgeInsets.all(24);
    const Color backgroundColor = Color.fromARGB(139, 181, 177, 214);

    return Container(
      margin: containerMargin,
      padding: containerPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -10,
              left: -30,
              child: Image.asset(
                "assets/images/home/1.png",
                width: 50,
              ),
            ),
            Positioned(
              bottom: 25,
              right: -10,
              child: Image.asset(
                "assets/images/home/2.png",
                width: 50,
              ),
            ),
            Column(
              children: [
                _buildText("FEATURED", 16, FontWeight.w700),
                SizedBox(
                  height: 10,
                ),
                _buildText("Take part in challenges", 18, FontWeight.bold),
                _buildText(
                    "with friends or other players", 18, FontWeight.bold),
                _buildText("players", 18, FontWeight.bold),
                SizedBox(height: 15),
                _FindFriendsButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo Text theo kiểu chuẩn
  Widget _buildText(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: fontWeight,
      ),
    );
  }
}

class _FindFriendsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: AppSizes.blockSizeHorizontal * 38,
      child: Row(
        children: [
          Image.asset(
            "assets/images/home/Icon.png",
            width: 20,
          ),
          SizedBox(width: 10),
          Text(
            "Find friends",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6A5AE0),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
