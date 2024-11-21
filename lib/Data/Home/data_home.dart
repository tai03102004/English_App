
import 'package:flutter/material.dart';

import '../../Widgets/Home/Topics/Topics.dart';

final List<String> entries = <String>[
  'Animals',
  'Transportation',
  'Family',
  'Nature',
];
// final List<Widget> pages = <Widget>[
//   Animals(),
//   Cities(),
//   Alphabet(),
//   Nature(),
// ];
final List<Widget> pages = <Widget>[
  Topic (topic:'Animals'),
  Topic (topic:'Transportation'),
  Topic (topic:'Family'),
  Topic (topic:'Nature'),
];
final List<String> images = <String>[
  'assets/images/home/animal.png',
  'assets/images/home/street.png',
  'assets/images/home/family.png',
  'assets/images/home/park.png'
];
final List<Color> colorCodes = <Color>[
  Color(0xFFA1D7FF),
  Color(0xFF6AFF5D),
  Color(0xFFFFDA35),
  Color(0xFFFF8D8D)
];
