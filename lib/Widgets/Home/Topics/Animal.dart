import 'package:flutter/material.dart';

class Animals extends StatefulWidget {
  const Animals({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Animals createState() => _Animals();
}

class _Animals extends State<Animals> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text("ANINAL"),
        )
      ],
    );
  }
}
