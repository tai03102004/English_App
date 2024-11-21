import 'package:app/Definitons/size_config.dart';
import 'package:flutter/material.dart';

class QuizCategory extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();

  // Danh sách dữ liệu quiz liên quan đến tiếng Anh
  final List<Map<String, dynamic>> quizData = [
    {
      "icon": Icons.translate,
      "title": "Từ vựng",
      "text": "Mở rộng vốn từ vựng của bạn"
    },
    {
      "icon": Icons.text_fields,
      "title": "Ngữ pháp",
      "text": "Thử thách kiến thức ngữ pháp"
    },
    {
      "icon": Icons.hearing,
      "title": "Phát âm",
      "text": "Luyện phát âm chuẩn như người bản xứ"
    },
    {
      "icon": Icons.book,
      "title": "Đọc hiểu",
      "text": "Cải thiện kỹ năng đọc hiểu"
    },
    {
      "icon": Icons.question_answer,
      "title": "Câu hỏi",
      "text": "Trả lời các câu hỏi thú vị"
    },
    {
      "icon": Icons.spellcheck,
      "title": "Chính tả",
      "text": "Thử thách chính tả tiếng Anh"
    },
    {
      "icon": Icons.language,
      "title": "Dịch thuật",
      "text": "Dịch câu và từ vựng"
    },
    {
      "icon": Icons.lightbulb,
      "title": "Idioms",
      "text": "Khám phá các thành ngữ tiếng Anh"
    },
    {
      "icon": Icons.games,
      "title": "Trò chơi chữ",
      "text": "Vui học tiếng Anh qua trò chơi"
    },
    {
      "icon": Icons.play_lesson,
      "title": "Luyện nghe",
      "text": "Phát triển kỹ năng nghe"
    },
  ];

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Stack(
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            final quiz = quizData[index]; // Truy xuất dữ liệu từng quiz
            return Card(
              elevation: 4,
              color: const Color.fromARGB(206, 255, 189, 90),
              child: GestureDetector(
                onTap: () {
                  // Thêm logic khi người dùng nhấn vào
                  print("Bạn đã chọn quiz: ${quiz['title']}");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(quiz['icon'], size: 40, color: Colors.blue),
                    const SizedBox(height: 8),
                    Text(
                      quiz['title'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      quiz['text'],
                      style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 29, 7, 7)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
