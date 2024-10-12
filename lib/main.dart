import 'package:app/Pages/AiBrainPage.dart';
import 'package:app/Pages/HomePage.dart';
import 'package:app/Widgets/Auth/Login.dart';
import 'package:app/Widgets/Auth/signup.dart';
import 'package:app/Widgets/Home/Topics/Alphabet.dart';
import 'package:app/Widgets/Home/Topics/Animal.dart';
import 'package:app/Widgets/Home/Topics/City.dart';
import 'package:app/Widgets/Home/Topics/Nature.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Roboto-Black"),
    home: const SafeArea(
      child: Scaffold(
        body: MyWidget(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/login',
      routes: {
        "/": (context) => const HomePage(),
        "/signup": (context) => const SignUp(),
        "/login": (context) => const Login(),
        '/aiBrain': (context) => AiBrainPage(),
        '/animals': (context) => Animals(),
        '/in_the_city': (context) => Cities(),
        '/alphabet': (context) => Alphabet(),
        '/nature': (context) => Nature(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
