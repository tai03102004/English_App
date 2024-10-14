import 'package:app/Data/News/dummy.dart';
import 'package:app/Pages/News/new_list_item.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) => NewsListItem(
          imageAssetPath: newsrItems[i]['imageAssetPath']!,
          category: newsrItems[i]['category']!,
          title: newsrItems[i]['title']!,
          content: newsrItems[i]['content']!,
          author: newsrItems[i]['author']!,
          authorImageAssetPath: newsrItems[i]['authorImageAssetPath']!,
          date: DateTime.parse(newsrItems[i]['date']!),
        ),
        childCount: newsrItems.length,
      ),
    );
  }
}
