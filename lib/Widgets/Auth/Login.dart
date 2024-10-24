import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isRememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Email Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Remember me checkbox
            Row(
              children: [
                Checkbox(
                  value: _isRememberMeChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isRememberMeChecked = value ?? false;
                    });
                  },
                ),
                Text('Remember me'),
              ],
            ),
            SizedBox(height: 20),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Điều hướng đến trang Home
                Navigator.pushReplacementNamed(context, '/home'); // Đảm bảo bạn đã định nghĩa route '/home' trong MaterialApp
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
              child: Text('LOG IN'),
            ),
            SizedBox(height: 10),
            // Forgot password text
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: Text('Forgot the password?'),
            ),
            SizedBox(height: 20),
            // Social login options
            Text('or continue with'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () {
                    // Handle Facebook login
                  },
                ),
                IconButton(
                  icon: Icon(Icons.g_translate, color: Colors.red),
                  onPressed: () {
                    // Handle Google login
                  },
                ),
                IconButton(
                  icon: Icon(Icons.apple, color: Colors.black),
                  onPressed: () {
                    // Handle Apple login
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
