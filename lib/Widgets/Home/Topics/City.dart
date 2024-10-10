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
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text("Cities"),
        )
      ],
    );
  }
}
