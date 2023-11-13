import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/domain/entity/news_entity.dart';
import 'package:soywarmi_app/presentation/bloc/news/get_news_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/news/get_news_state.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: NBColorWhite,
        elevation: 0,
        
        title: const Text('Noticias SoyWarmi', style: TextStyle(color: NBPrimaryColor)),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: BlocBuilder<GetNewsCubit, GetNewsState>(
          bloc: sl<GetNewsCubit>()..getNews(),
          builder: (context, state) {
            if (state is GetNewsLoaded) {
              
              return NewsList(newsList: state.news);
            }

            if (state is GetNewsError) {
              
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.blue,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
              );
            }

            
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<NewsEntity> newsList;

  const NewsList({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsCard(news: newsList[index]);
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  final NewsEntity news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: news.image == ''
                    ? const AssetImage(NbLogoPost)
                    : NetworkImage(news.image) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              news.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              news.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
