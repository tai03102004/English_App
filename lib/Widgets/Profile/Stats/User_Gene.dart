// ignore: file_names
import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/Profile/Stats/Result.dart';
import 'package:app/Widgets/Profile/Stats/Statistics.dart';
import 'package:app/Widgets/Profile/Stats/Top_Performance.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class User_Gene extends StatelessWidget {
  const User_Gene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.blockSizeHorizontal * 2,
                  right: AppSizes.blockSizeHorizontal * 2,
                  top: AppSizes.blockSizeVertical * 4.6,
                ),
                child: Container(
                  height: AppSizes.screenHeight * 1.32,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(107, 246, 128, 120),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/users/avatar.jpg'),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Madelyn Dias',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Result(),
                    SizedBox(height: 16),
                    Statistics(),
                    SizedBox(
                      height: 20,
                    ),
                    TopPerformance(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
