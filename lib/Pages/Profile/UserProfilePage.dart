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

    // Lấy thông tin từ arguments nếu có
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    final String? userName = arguments?['name'] ?? user?.displayName ?? 'User';
    final String? userPhotoUrl = arguments?['photoUrl'] ?? user?.photoURL;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: userPhotoUrl != null
                      ? NetworkImage(userPhotoUrl)
                      : AssetImage('assets/images/avatar.png') as ImageProvider,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        userName!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Nút cài đặt ở góc trên bên phải
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Điều hướng đến trang cài đặt
                  },
                  iconSize: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ),

          // Thống kê Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'Thống kê',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                // Thêm các thống kê của người dùng vào đây
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard('Ngày học', '45', Colors.orange),
                    _buildStatCard('Điểm XP', '1230', Colors.blue),
                    _buildStatCard('Thành tích', '8', Colors.purple),
                  ],
                ),
                const SizedBox(height: 20),
                // Nút "Thêm bạn bè"
                ElevatedButton.icon(
                  onPressed: () {
                    // Xử lý thêm bạn bè
                  },
                  icon: const Icon(Icons.person_add, color: Colors.black), // Icon add friend
                  label: const Text(
                    'THÊM BẠN BÈ',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Nền trắng
                    side: const BorderSide(color: Colors.black), // Viền đen
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Hình dạng vuông
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
