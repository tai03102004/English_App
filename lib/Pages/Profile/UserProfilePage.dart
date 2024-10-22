import 'package:app/Components/Header/Header_Genral.dart';
import 'package:app/Definitons/size_config.dart';
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
        flexibleSpace: Info(check: true),
      ),
      body: Center(
        child: const Text("UserProfilePage"),
      ),
    );
  }
}
