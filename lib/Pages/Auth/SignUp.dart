import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _errorMessage;

  bool _isLoading = false;

  void _signUp() async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill in all fields.';
      });
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = 'Passwords do not match.';
      });
      return;
    }

    // Email validation regex
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailPattern).hasMatch(_emailController.text)) {
      setState(() {
        _errorMessage = 'Invalid email format.';
      });
      return;
    }

    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null; // Clear any previous error messages
      });

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Optionally, save user data to Firestore or other services here
      // await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({});

      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message; // Display the error message from Firebase
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'An unknown error occurred. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
                  },
                ),
                SizedBox(width: 10),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/capy_signup.png', height: 150),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Re-enter Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading ? null : _signUp, // Disable button while loading
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD3B591),
                minimumSize: Size(double.infinity, 50),
              ),
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white) // Show loading spinner
                  : Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login'); // Navigate to login page
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
