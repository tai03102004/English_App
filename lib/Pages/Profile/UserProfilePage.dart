import 'package:app/Components/Header/Header_Genral.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/Profile/Stats/User_Gene.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfilePage createState() => _UserProfilePage();
}

class _UserProfilePage extends State<UserProfilePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7C72E5),
        elevation: 0, // Tùy chọn để xóa bóng đổ
        flexibleSpace: Info(
          check: false,
          check_name: false,
        ),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            offset: Offset(0, 40),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.view_list_outlined, size: 20),
                  title: Text("Lists", style: TextStyle(fontSize: 14)),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.leaderboard, size: 20),
                  title: Text("Leadings", style: TextStyle(fontSize: 14)),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            User_Gene(),
          ],
        ),
      ),
    );
  }
}
