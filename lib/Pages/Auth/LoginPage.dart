import 'package:app/Widgets/Auth/Login.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),

      ),
      body: Login(),
    );
  }
}
