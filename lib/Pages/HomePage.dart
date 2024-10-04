import 'package:app/Components/Footer/Menu.dart';
import 'package:app/Components/Header/AppBar.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/Home/Home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: Header(),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Home(),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: SafeArea(
                child: Menu(currentIndex: currentIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
