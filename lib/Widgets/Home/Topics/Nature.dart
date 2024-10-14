import 'package:app/Components/HomeTopButton.dart';
import 'package:flutter/material.dart';

class Nature extends StatefulWidget {
  const Nature({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Nature createState() => _Nature();
}

class _Nature extends State<Nature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeTopButton(),
          ],
        ),
      ),
    );
  }
}
