// ignore: file_names
import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/News/home_heading.dart';
import 'package:app/Widgets/News/home_slider.dart';
import 'package:app/Widgets/News/new_list.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeHeading(
              title: "Breking news",
              traling: TextButton(onPressed: () {}, child: Text("View all")),
            ),
            HomeSlider(),
            HomeHeading(
              title: "Recommendation",
              traling: TextButton(onPressed: () {}, child: Text("View all")),
            ),
            NewsList(),
          ],
        ),
      ),
    );
  }
}
