import 'package:app/Data/IPA/ipa.dart';
import 'package:app/Pages/Pronunciation/Pronunciation.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Pronunciation_Topic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pronunciation Practice")),
      body: ListView.builder(
        itemCount: 22,
        itemBuilder: (context, index) {
          String audioPath = '/audios/ipa/${index + 1}.mp3';
          String title = ipaSounds[index].symbol;
          String tip1 = ipaSounds[index].description;
          String tip2 = ipaSounds[index].mouthPosition;
          String tip3 = ipaSounds[index].tonguePosition;

          return ListTile(
            title: Text("Practice ${index + 1}:  $title"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Pronunciation(
                    audioPath: audioPath,
                    title: title,
                    tip1: tip1,
                    tip2: tip2,
                    tip3: tip3,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
