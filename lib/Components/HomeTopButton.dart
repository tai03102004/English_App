import 'package:app/Widgets/News/app_rounded_button.dart';
import 'package:flutter/material.dart';


class HomeTopButton extends StatelessWidget implements PreferredSizeWidget {
  final String topic;

  const HomeTopButton({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.brown.shade600, Colors.brown.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Back Button
          AppRoundedButton(
            iconData: Icons.keyboard_return_outlined,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 16),
          // Topic Title
          Expanded(
            child: Center(
              child: Text(
                topic,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis, // Handles long topics gracefully
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Topic Image
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
              'assets/images/home/${topic.toLowerCase()}.png',
            ),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70); // Set AppBar height
}
