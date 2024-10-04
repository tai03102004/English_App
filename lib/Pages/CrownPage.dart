import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';

class CrownPage extends StatefulWidget {
  const CrownPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CrownPage createState() => _CrownPage();
}

class _CrownPage extends State<CrownPage> with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CrownPage'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
      ),
      body: Center(
        child: const Text("CrownPage"),
      ),
    );
  }
}
