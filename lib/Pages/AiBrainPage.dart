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
        title: const Text('AiBrainPage'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
      ),
      body: Center(
        child: const Text("AiBrainPage"),
      ),
    );
  }
}