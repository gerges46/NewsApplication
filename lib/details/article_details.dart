import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.article});
  final Map<String, dynamic> article;

  @override
  Widget build(BuildContext context) {
    String imageUrl = article['urlToImage'] ??
        'https://ichef.bbci.co.uk/news/1024/branded_news/a35f/live/ac636200-7f45-11ef-b424-67cd1e4179ac.jpg';
    String title = article['title'] ?? 'No Title Available';
    String publishedAt = article['publishedAt'] ?? 'Unknown Date';
    String description = article['description'] ?? 'No description Available';

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0), // Add padding for spacing
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
            /* maxLines: 4,
            overflow: TextOverflow.ellipsis, */
          ),
      const    SizedBox(height: 30,),
         Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
         ),
const  SizedBox(height: 30,),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
            /* maxLines: 4,
            overflow: TextOverflow.ellipsis, */
          ),
       const     SizedBox(height: 30,),
          Text(
            publishedAt,
            style: const TextStyle(
              
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
