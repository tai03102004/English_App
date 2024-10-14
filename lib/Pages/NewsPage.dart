import 'package:app/Components/Header/AppBar.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/News/News.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: Header(),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: News(),
            ),
          ],
        ),
      ),
    );
  }
}
