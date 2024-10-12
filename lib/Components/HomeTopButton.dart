import 'package:app/Pages/News/app_rounded_button.dart';
import 'package:flutter/material.dart';

class HomeTopButton extends StatelessWidget {
  const HomeTopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppRoundedButton(
          iconData: Icons.menu,
        )
      ],
    );
  }
}
