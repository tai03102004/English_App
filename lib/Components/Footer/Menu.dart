import 'package:app/Components/Footer/Bottom_Nav_Btn.dart';
import 'package:app/Components/Footer/Clipper.dart';
import 'package:app/Definitons/Color.dart';
import 'package:app/Definitons/Constants.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:app/Pages/AiBrainPage.dart';
import 'package:app/Pages/ChampionPage.dart';
import 'package:app/Pages/CrownPage.dart';
import 'package:app/Pages/HomePage.dart';
import 'package:app/Pages/UserProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconly/iconly.dart';

class Menu extends StatefulWidget {
  final int currentIndex;
  const Menu({required this.currentIndex, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  final List<Widget> pages = [
    HomePage(),
    ChampionPage(),
    AiBrainPage(),
    CrownPage(),
    UserProfilePage(),
  ];

  void navigateTo(int index) {
    if (index == _currentIndex) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pages[index]),
    ).then((_) {
      setState(() {
        _currentIndex = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buttonNavItems = [
      {'icon': IconlyLight.home, 'index': 0},
      {'icon': HugeIcons.strokeRoundedChampion, 'index': 1},
      {'icon': HugeIcons.strokeRoundedAiBrain02, 'index': 2},
      {'icon': HugeIcons.strokeRoundedCrown, 'index': 3},
      {'icon': IconlyLight.user, 'index': 4},
    ];

    return Padding(
        padding: EdgeInsets.fromLTRB(AppSizes.blockSizeHorizontal * 4.5, 0,
            AppSizes.blockSizeHorizontal * 4.5, 30),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 6,
          color: Colors.transparent,
          child: Container(
            width: AppSizes.screenWidth,
            height: AppSizes.screenHeight * 0.08,
            decoration: BoxDecoration(
              color: sectionColors['footer_box'],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                // List of Button Navigation bar icons
                Positioned(
                  bottom: 0,
                  top: 0,
                  left: AppSizes.blockSizeHorizontal * 3,
                  right: AppSizes.blockSizeHorizontal * 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: buttonNavItems.map((item) {
                      return BottomNavBtn(
                        icon: item['icon'],
                        index: item['index'],
                        currentIndex: _currentIndex,
                        onPressed: (val) => navigateTo(val),
                      );
                    }).toList(),
                  ),
                ),

                // Animated Indicator for showing selected items
                AnimatedPositioned(
                    duration: const Duration(microseconds: 300),
                    curve: Curves.decelerate,
                    left: animatedPositionedLEftValue(_currentIndex),
                    child: Column(
                      children: [
                        Container(
                          height: AppSizes.blockSizeHorizontal * 1.0,
                          width: AppSizes.blockSizeHorizontal * 12,
                          decoration: BoxDecoration(
                            color: sectionColors['footer_light'],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        ClipPath(
                          clipper: MyCustomClipper(),
                          child: Container(
                            height: AppSizes.blockSizeHorizontal * 15,
                            width: AppSizes.blockSizeHorizontal * 12,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: gradient,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
