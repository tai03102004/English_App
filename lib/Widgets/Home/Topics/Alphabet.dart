import 'package:flutter/material.dart';

class Alphabet extends StatefulWidget {
  const Alphabet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Alphabet createState() => _Alphabet();
}

class _Alphabet extends State<Alphabet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text("Alphabet"),
        )
      ],
    );
  }
}
