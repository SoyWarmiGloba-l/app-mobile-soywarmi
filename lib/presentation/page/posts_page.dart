import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/presentation/bloc/publications/get_publications_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/publications/get_publications_state.dart';
import 'package:soywarmi_app/presentation/widget/card_post_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Theme.of(context).primaryColor,
        onRefresh: () async {
          sl<GetPublicationsCubit>().getPublications();
        },
        child: SingleChildScrollView(
          child: BlocBuilder<GetPublicationsCubit, GetPublicationsState>(
            bloc: sl<GetPublicationsCubit>()..getPublications(),
            builder: (context, state) {
              if (state is GetPublicationsError) {
                return Center(
                  child: Text(state.message),
                );
              }
          
              if (state is GetPublicationsLoaded) {
        
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.publications.length,
                  itemBuilder: (context, index) {
                    final publication = state.publications[index];
                    return CardPostPage(
                      publication: publication,
                    );
                  },
                );
              }
          
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
