import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapplication/components/article_item.dart';

class ArticleBuilder extends StatelessWidget {
  const ArticleBuilder({super.key, this.list});
  final list;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: list.length > 0,
        builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                BuildArticleItem(article: list[index]),
            separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(12),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
            itemCount: list.length),
        fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
