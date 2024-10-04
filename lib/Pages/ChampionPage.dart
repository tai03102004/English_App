import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';

class ChampionPage extends StatefulWidget {
  const ChampionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChampionPage createState() => _ChampionPage();
}

class _ChampionPage extends State<ChampionPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ChampionPage'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
      ),
      body: Center(
        child: const Text("ChampionPage"),
      ),
    );
  }
}
