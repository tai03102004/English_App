import 'package:app/Data/Home/data_home.dart';
import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/Home/Level_Home.dart';
import 'package:app/Widgets/Home/Topics/Topics.dart';
import 'package:flutter/material.dart';

class HomeItem2 extends StatefulWidget {
  const HomeItem2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeItem2 createState() => _HomeItem2();
}

class _HomeItem2 extends State<HomeItem2> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height *
            0.8, // Adjust the height as needed
        child: PageView.builder(
          itemCount: levels.keys.length,
          itemBuilder: (context, levelIndex) {
            int level = levels.keys.toList()[levelIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                //   child: Text(
                //     "Level $level",
                //     style: TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black,
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                LevelHome(level: level),
                Expanded(
                  child: ListView.builder(
                    itemCount: levels[level]!.length,
                    itemBuilder: (context, topicIndex) {
                      var topic = levels[level]![topicIndex];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Topic(topic: topic['title'])));
                        },
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          decoration: BoxDecoration(
                            color: topic['color'],
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Topic details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.fromLTRB(26, 0, 0, 0),
                                          child: Text(
                                            "0/15",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        SizedBox(
                                          width: 63,
                                          height: 3,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(4),
                                            child: LinearProgressIndicator(
                                              value: 1,
                                              backgroundColor: Colors.green[200],
                                              valueColor: const AlwaysStoppedAnimation<Color>(
                                                  Colors.green),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 28),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            size: 16,
                                            color: Colors.blue,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          44, 0, 0, 0),
                                      child: Text(
                                        topic['title'],
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Lato',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(57, 0, 0, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                136, 255, 254, 254),
                                            width: 1.0,
                                          ),
                                          color: topic['color'],
                                        ),
                                        width: 60,
                                        height:
                                            AppSizes.blockSizeHorizontal * 6,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "View",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Lato'),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.play_arrow,
                                                size: 8,
                                                color: Colors.blue,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Topic image
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30), // Rounded corners
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26, // Soft shadow
                                        offset: Offset(2, 2),
                                        blurRadius: 6,
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(topic['image']),
                                      fit: BoxFit.cover, // Ensures the image fills the container
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
