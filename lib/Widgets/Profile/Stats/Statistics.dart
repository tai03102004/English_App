import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/Profile/Stats/Stats.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  // Đặt Stats làm widget mặc định
  Widget displayedWidget = const Stats();

  @override
  void initState() {
    super.initState();
    // Mặc định hiển thị trang thứ 2 (Stats)
    displayedWidget = const Stats();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: AppSizes.screenWidth * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    displayedWidget = const Text("Hello");
                  });
                },
                child: const Text("Badge"),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    displayedWidget = const Stats();
                  });
                },
                child: const Text("Stats"),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    displayedWidget = const Text("Details shown");
                  });
                },
                child: const Text("Details"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        displayedWidget,
      ],
    );
  }
}
