import 'package:flutter/material.dart';

class TimerRanking extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TimerRankingState createState() => _TimerRankingState();
}

class _TimerRankingState extends State<TimerRanking> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 16),
        sliver: SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurpleAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: selectedIndex == 0
                            ? Colors.purple.shade300
                            : Colors.deepPurpleAccent,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Text(
                          "Weekly",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == 0
                                ? Colors.white
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: selectedIndex == 1
                            ? Colors.purple.shade300
                            : Colors.deepPurpleAccent,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Text(
                          "All Time",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == 1
                                ? Colors.white
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
