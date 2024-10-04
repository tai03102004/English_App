import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';

class BottomNavBtn extends StatelessWidget {
  const BottomNavBtn(
      {super.key,
      required this.icon,
      required this.index,
      required this.currentIndex,
      required this.onPressed});

  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return InkWell(
        onTap: () {
          onPressed(index);
        },
        child: Container(
            height: AppSizes.blockSizeHorizontal * 13,
            width: AppSizes.blockSizeHorizontal * 17,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(alignment: Alignment.center, children: [
              (currentIndex == index)
                  ? Positioned(
                      left: AppSizes.blockSizeHorizontal * 4,
                      bottom: AppSizes.blockSizeHorizontal * 1.5,
                      child: Icon(
                        icon,
                        color: const Color.fromARGB(59, 0, 0, 0),
                        size: AppSizes.blockSizeHorizontal * 7,
                      ),
                    )
                  : Container(),
              AnimatedOpacity(
                opacity: (currentIndex == index) ? 1 : .2,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: Icon(
                  icon,
                  color: Colors.yellow[400],
                  size: AppSizes.blockSizeHorizontal * 8,
                ),
              )
            ])));
  }
}
