import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePage createState() => _UserProfilePage();
}

class _UserProfilePage extends State<UserProfilePage>
    with SingleTickerProviderStateMixin {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    final String? userName = arguments?['name'] ?? user?.displayName ?? 'User';
    final String? userPhotoUrl = arguments?['photoUrl'] ?? user?.photoURL;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // Điều hướng đến trang cài đặt
                    },
                    icon: const Icon(Icons.settings),
                    iconSize: 40,
                    color: Color(0xFF000000),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                height: 150,
                child: Image(
                  image: userPhotoUrl != null
                      ? NetworkImage(userPhotoUrl)
                      : AssetImage('assets/images/avatar.png') as ImageProvider,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userName!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 180,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF000000),
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Edit profile",
                        style: TextStyle(
                          color: Color(0xFFffffff),
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thống kê',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  StatCard(
                    title: 'Tổng Units đã học',
                    value: '0',
                  ),
                  const SizedBox(height: 10),
                  StatCard(
                    title: 'Tổng Words đã học',
                    value: '0',
                  ),
                  const SizedBox(height: 10),
                  StatCard(
                    title: 'Ngày học',
                    value: '0',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFD3b591),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width:30),
          Text(
            value,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 40),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

