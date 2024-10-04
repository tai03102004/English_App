import 'package:flutter/material.dart';

Map<String, dynamic> sectionColors = {
  'header': LinearGradient(
    colors: <Color>[Color(0xFF8CEF42), Color(0xFF58A700)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  'transparent': Colors.transparent,
  'footer': Colors.black,
  'footer_icon': Colors.yellow[400],
  'footer_icon_shadow': Color.fromARGB(59, 0, 0, 0),
  'footer_box': Colors.grey[900],
  'footer_light': Colors.yellow,
  'body': Colors.blue,
  'sidebar': Colors.green,
  'bg_white': Colors.white,
  'dot_home': Colors.grey.shade300,
};

final List<Color> gradient = [
  Colors.yellow.withOpacity(0.8),
  Colors.yellow.withOpacity(0.5),
  Colors.transparent
];
