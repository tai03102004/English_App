import 'package:flutter/material.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeItem createState() => _HomeItem();
}

class _HomeItem extends State<HomeItem> {
  final List<String> entries = <String>[
    'Animals',
    'In the City',
    'Alphabet',
    'Nature',
  ];
  final List<String> images = <String>[
    'assets/images/animal.png',
    'assets/images/street.png',
    'assets/images/alphabet.png',
    'assets/images/park.png'
  ];
  final List<Color> colorCodes = <Color>[
    Color(0xFFA1D7FF),
    Color(0xFF6AFF5D),
    Color(0xFFFFDA35),
    Color(0xFFFF8D8D)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 75, bottom: 120),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: colorCodes[index],
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expanded Column to avoid overflow
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
                      padding: EdgeInsets.fromLTRB(44, 0, 0, 0),
                      child: Text(
                        entries[index],
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lato'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(57, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: colorCodes[index],
                        ),
                        width: 60,
                        height: 18,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                    )
                  ],
                ),
              ),

              // Flexible Image to avoid overflow
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 27, 0),
                child: Image.asset(
                  images[index],
                  width: 83,
                  height: 83,
                  // fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
