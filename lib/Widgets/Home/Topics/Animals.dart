import 'package:app/Components/HomeTopButton.dart';
import 'package:app/Widgets/Flashcard/Flashcard.dart';
import 'package:flutter/material.dart';

class Animals extends StatefulWidget {
  const Animals({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Animals createState() => _Animals();
}

class _Animals extends State<Animals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeTopButton(),
            SliverToBoxAdapter(
              child: FlashcardList(),
            )
          ],
        ),
      ),
    );
  }
}
