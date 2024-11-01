import 'package:app/Components/Header/Home_Header.dart';
import 'package:app/Components/Header/Header_Genral.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/Home/Level_Home.dart';
import 'package:app/Widgets/Home/HomeItem.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7C72E5),
        elevation: 0, // Tùy chọn để xóa bóng đổ
        flexibleSpace: Info(
          check: true,
          check_name: true,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color(0xFFF1F1F1),
        child: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              Home_Header(),
              LevelHome(),
              HomeItem(),
            ],
          ),
        ),
      ),
    );
  }
}
