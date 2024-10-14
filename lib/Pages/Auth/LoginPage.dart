import 'package:flutter/material.dart';
import '../../Widgets/Auth/Login.dart';

class LoginPage extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Trạng thái form nhập vào
  String _username = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {   // Kiểm tra tính hợp lệ của form
      Navigator.pushReplacementNamed(context, '/home');   // Đăng nhập thành công chuyển sang Home
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(
        formKey: _formKey,
        username: _username,
        password: _password,
        onUsernameChanged: (value) {
          setState(() {
            _username = value;
          });
        },
        onPasswordChanged: (value) {
          setState(() {
            _password = value;
          });
        },
        onLoginPressed: _login,
      ),
    );
  }
}
