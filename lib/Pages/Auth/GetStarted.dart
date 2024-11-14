import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/Pages/Auth/LoginPage.dart';
import 'package:app/Pages/Auth/SignUpPage.dart';
import '../Home/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstLaunch = await _checkFirstLaunch();

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

Future<bool> _checkFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  // Lưu trạng thái rằng app đã được mở lần đầu
  if (isFirstLaunch) {
    await prefs.setBool('isFirstLaunch', false);
  }

  return isFirstLaunch;
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;

  MyApp({required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isFirstLaunch ? GetStarted() : HomePage(), // Chuyển đến màn hình Get Started nếu là lần đầu
    );
  }
}

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/capylogo.png',
                  height: 200,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'TRIOPYBARA',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD3B591),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: Color(0xFF917C63),
                        width: 2,
                      ),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Color(0xFF917C63)),
                    minimumSize: Size(double.infinity, 50), // full width button
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 18, color: Color(0xFFD3B591)),
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
