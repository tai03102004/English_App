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

  String selecTab = "Badge";

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
                    selecTab = "Badge";
                  });
                },
                child: Text(
                  "Badge",
                  style: TextStyle(
                    fontWeight: selecTab == 'Badge'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: selecTab == 'Badge' ? 16 : 14,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    displayedWidget = const Stats();
                    selecTab = "Stats";
                  });
                },
                child: Text(
                  "Stats",
                  style: TextStyle(
                    fontWeight: selecTab == 'Stats'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: selecTab == 'Stats' ? 16 : 14,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    displayedWidget = const Text("Details shown");
                    selecTab = "Details";
                  });
                },
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: selecTab == 'Details'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: selecTab == 'Details' ? 16 : 14,
                  ),
                ),
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
