import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/components/article_card.dart';
import 'package:news_buzz/components/custom_text.dart';
import 'package:news_buzz/components/theme_switcher.dart';
import 'package:news_buzz/cubit/news_feed_cubit.dart';
import 'package:news_buzz/model/news_data_model.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  late List<Article> fetchedArticles;
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<NewsFeedCubit>().getNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: kToolbarHeight - 10,
          child: SearchBar(
            controller: searchController,
            hintText: 'Search anything',
            trailing: [Icon(Icons.search)],
            elevation: WidgetStatePropertyAll(2),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            side: WidgetStatePropertyAll(BorderSide.none),
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.secondaryContainer,
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                context.read<NewsFeedCubit>().getNewsArticles(keyword: value);
              }
            },
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ThemeSwitcher(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<NewsFeedCubit, NewsFeedState>(
          builder: (context, state) {
            if (state is NewsFeedLoaded) {
              fetchedArticles = state.articles;
              if (state.articles.isEmpty) {
                return Center(child: CustomText("No articles available"));
              }
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  context.read<NewsFeedCubit>().getNewsArticles(
                    keyword: searchController.text,
                  );
                },
                child: ListView.builder(
                  itemCount: fetchedArticles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ArticleCard(articles: fetchedArticles, index: index);
                  },
                ),
              );
            }
            if (state is NewsFeedFailed) {
              return Center(
                child: CustomText(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          },
        ),
      ),
    );
  }
}
