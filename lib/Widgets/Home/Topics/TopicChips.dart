import 'package:flutter/material.dart';

import 'Topics.dart';

class TopicChips extends StatelessWidget {
  final String currentTopic;
  final Map<int, List<Map<String, dynamic>>> levels;

  const TopicChips({
    Key? key,
    required this.currentTopic,
    required this.levels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Flatten levels map into a list of unique topics excluding the current topic
    final currentLevel = levels.entries.firstWhere(
      (entry) => entry.value.any((topic) => topic['title'] == currentTopic),
      orElse: () => MapEntry(0, []),
    );

// Filter topics within the same level excluding the current topic
    final filteredTopics = currentLevel.value
        .where((topic) => topic['title'] != currentTopic)
        .toList();

    return SliverToBoxAdapter(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Các chủ đề khác",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: filteredTopics.map((topic) {
              return GestureDetector(
                child: _buildTopicChip(topic['title']),
                onTap: () {
                  // Handle chip tap, for example, navigate to a new screen with the selected topic
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Topic(topic: topic['title'])));
                  print("Tapped on topic: ${topic['title']}");
                },
              );
            }).toList(),
          ),
        ),
      ]),
    ));
  }

  // Builds the individual topic chip
  Widget _buildTopicChip(String topic) {
    return Chip(
      label: Text(
        topic,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      backgroundColor: Colors.brown,
      elevation: 4,
      shadowColor: Colors.brown.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.brown.shade800, width: 1),
      ),
    );
  }
}
