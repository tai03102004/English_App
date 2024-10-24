import 'package:app/Components/Footer/Menu.dart';
import 'package:app/Components/Header/AppBar.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/Dictionary/Dictionary.dart';
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
  double xPosition = 100;
  double yPosition = 100;

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
            Positioned(
              left: xPosition,
              top: yPosition,
              child: GestureDetector(
                onPanUpdate: (details) {
                  // Update the position of the icon based on user drag
                  setState(() {
                    xPosition += details.delta.dx;
                    yPosition += details.delta.dy;
                  });
                },
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dictionary()));
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
