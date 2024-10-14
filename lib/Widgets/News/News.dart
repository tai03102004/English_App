// ignore: file_names
import 'package:app/Pages/News/home_heading.dart';
import 'package:app/Pages/News/home_slider.dart';
import 'package:app/Pages/News/new_list.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // HomeTopButton(),
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
