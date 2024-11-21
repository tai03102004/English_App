import 'package:app/Components/HomeTopButton.dart';
import 'package:app/Pages/MultipleChoice/MultipleChoice.dart';
import 'package:flutter/material.dart';

import '../../Flashcard/Flashcard.dart';

class Nature extends StatefulWidget {
  const Nature({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Nature createState() => _Nature();
}

class _Nature extends State<Nature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeTopButton(),
            SliverToBoxAdapter(
              child: FlashcardList(
                topic: 'Nature',
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestPage(
                        words: [
                          {'word': 'apple', 'definition': 'Quả táo'},
                          {'word': 'banana', 'definition': 'Quả chuối'},
                          {'word': 'cherry', 'definition': 'Quả che ri'},
                          {'word': 'grape', 'definition': 'Quả nho'},
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Kiểm tra",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


