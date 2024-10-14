import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String username;
  final String password;
  final Function(String) onUsernameChanged;
  final Function(String) onPasswordChanged;
  final VoidCallback onLoginPressed;

  const LoginForm({
    required this.formKey,
    required this.username,
    required this.password,
    required this.onUsernameChanged,
    required this.onPasswordChanged,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/capylogo.png',
            height: 200,
          ),
          SizedBox(height: 20), // Khoảng trống giữa logo và phần đăng nhập
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onChanged: onUsernameChanged,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onChanged: onPasswordChanged,
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: onLoginPressed,
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
