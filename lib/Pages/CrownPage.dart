import 'package:app/Components/HomeTopButton.dart';
import 'package:flutter/material.dart';

class CrownPage extends StatelessWidget {
  const CrownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeTopButton(),
            Center(
              child: Text("NEWS"),
            ),
          ],
        ),
      ),
    );
  }
}
