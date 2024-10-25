import 'package:app/Widgets/Home/Topics/Alphabet.dart';
import 'package:app/Widgets/Home/Topics/Animals.dart';
import 'package:app/Widgets/Home/Topics/In_the_city.dart';
import 'package:app/Widgets/Home/Topics/Nature.dart';
import 'package:flutter/material.dart';

final List<String> entries = <String>[
  'Animals',
  'In the City',
  'Alphabet',
  'Nature',
];
final List<Widget> pages = <Widget>[
  Animals(),
  Cities(),
  Alphabet(),
  Nature(),
];
final List<String> images = <String>[
  'assets/images/home/animal.png',
  'assets/images/home/street.png',
  'assets/images/home/alphabet.png',
  'assets/images/home/park.png'
];
final List<Color> colorCodes = <Color>[
  Color(0xFFA1D7FF),
  Color(0xFF6AFF5D),
  Color(0xFFFFDA35),
  Color(0xFFFF8D8D)
];
