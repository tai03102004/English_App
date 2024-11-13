import 'package:app/Components/HomeTopButton.dart';
import 'package:flutter/material.dart';

import '../../Flashcard/Flashcard.dart';

class Alphabet extends StatefulWidget {
  const Alphabet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Alphabet createState() => _Alphabet();
}

class _Alphabet extends State<Alphabet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeTopButton(),
            SliverToBoxAdapter(
              child: FlashcardList(topic: 'Family',),
            )
          ],
        ),
      ),
    );
  }
}
