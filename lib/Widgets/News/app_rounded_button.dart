import 'package:app/Definitons/Theme/New_Color.dart';
import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;
  const AppRoundedButton({Key? key, this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.athenasGray,
      borderRadius: BorderRadius.circular(56),
      child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(iconData),
          )),
    );
  }
}