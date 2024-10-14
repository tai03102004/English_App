import 'package:app/Pages/News/app_rounded_button.dart';
import 'package:flutter/material.dart';

class HomeTopButton extends StatelessWidget {
  const HomeTopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            AppRoundedButton(
              iconData: Icons.keyboard_return_outlined,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            AppRoundedButton(
              iconData: Icons.search,
              onTap: () {},
            ),
            SizedBox(
              width: 10,
            ),
            AppRoundedButton(
              iconData: Icons.notifications_outlined,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
