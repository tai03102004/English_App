import 'package:app/Components/Footer/Menu.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:app/Pages/AiBrain/AiBrainPage.dart';
import 'package:app/Pages/Champion/ChampionPage.dart';
import 'package:app/Pages/Home/HomePage.dart';
import 'package:app/Pages/NewsPage.dart';
import 'package:app/Pages/Profile/UserProfilePage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        children: const [
          HomePage(),
          ChampionPage(),
          AiBrainPage(),
          NewsPage(),
          UserProfilePage(),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Menu(
            currentIndex: _pageIndex,
            pageController: _pageController,
            onTap: (value) {
              _pageController.jumpToPage(value);
            },
          )),
    );
  }
}