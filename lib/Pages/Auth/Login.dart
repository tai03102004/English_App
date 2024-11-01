import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isRememberMeChecked = false;
  bool _obscureText = true; // Biến để điều khiển trạng thái hiển thị mật khẩu

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/capy_login.png', height: 180),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.account_circle_sharp),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Password Field
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD3B591),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'LOG IN',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Forgot password text
            TextButton(
              onPressed: () {
                // Xử lý quên mật khẩu
              },
              child: Text('Forgot the password?'),
            ),
            SizedBox(height: 20),
            // Social login options
            Text('or continue with'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    // Đăng nhập bằng Google
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
