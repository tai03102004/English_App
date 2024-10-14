import 'package:app/Components/HomeTopButton.dart';
import 'package:flutter/material.dart';

class Cities extends StatefulWidget {
  const Cities({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Cities createState() => _Cities();
}

class _Cities extends State<Cities> {
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
