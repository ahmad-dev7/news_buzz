import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_buzz/components/custom_text.dart';
import 'package:news_buzz/constants/k_date_format.dart';
import 'package:news_buzz/model/news_data_model.dart';
import 'package:news_buzz/screens/source_web_view_screen.dart';

class ArticleCard extends StatelessWidget {
  final List<Article> articles;
  final int index;
  const ArticleCard({super.key, required this.articles, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(0),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => ArticleWebView(
                      title: articles[index].sourceName,
                      sourceUrl: articles[index].url,
                    ),
              ),
            );
          },
          contentPadding: EdgeInsets.all(0),
          minVerticalPadding: 0,
          title: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: FancyShimmerImage(
              imageUrl: articles[index].urlToImage,
              boxFit: BoxFit.cover,
              height: 200,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              spacing: 10,
              children: [
                // Headline
                CustomText(
                  articles[index].title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(),
                // Source & Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      padding: EdgeInsets.all(2),
                      label: CustomText(
                        kFormatDate(articles[index].publishedAt),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      side: BorderSide.none,
                      avatar: Icon(Icons.calendar_month),
                    ),
                    Chip(
                      padding: EdgeInsets.all(2),
                      side: BorderSide.none,
                      label: CustomText(
                        articles[index].sourceName,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      avatar: Icon(Icons.source),
                    ),
                  ],
                ),
                // Description
                CustomText(
                  articles[index].description,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
