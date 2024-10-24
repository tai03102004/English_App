import 'package:app/Components/Header/Header_Genral.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';

class AiBrainPage extends StatefulWidget {
  const AiBrainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AiBrainPage createState() => _AiBrainPage();
}

class _AiBrainPage extends State<AiBrainPage>
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
          check: true,
          check_name: true,
        ),
      ),
      body: Center(
        child: const Text("AiBrainPage"),
      ),
    );
  }
}
