import 'package:app/Widgets/Auth/Login.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press here
            Navigator.pop(context);
          },
        ),
      ),
      body: Login(),  // Use the Login widget from Login.dart
    );
  }
}
