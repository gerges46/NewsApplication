import 'package:flutter/material.dart';
import 'package:newsapplication/details/article_details.dart';



class BuildArticleItem extends StatelessWidget {
  final article;
  const BuildArticleItem({
    super.key,
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    String imageUrl = article['urlToImage'] ??
        'https://ichef.bbci.co.uk/news/1024/branded_news/a35f/live/ac636200-7f45-11ef-b424-67cd1e4179ac.jpg'; // Default image URL
    String title = article['title'] ?? 'No Title Available'; // Default title
    String publishedAt = article['publishedAt'] ?? 'Unknown Date';
    return InkWell(
      onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleDetailsScreen(article: article)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0 + 12),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(publishedAt,
                        style: const TextStyle(
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
