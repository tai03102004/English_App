import 'package:app/Pages/Auth/LoginPage.dart';
import 'package:app/Pages/MainHome.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Triopybara",
      theme: ThemeData(
        fontFamily: "Roboto-Black",
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MainPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
