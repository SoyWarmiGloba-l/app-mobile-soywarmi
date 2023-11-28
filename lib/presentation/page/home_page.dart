import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/presentation/bloc/activity/get_activity_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/activity/get_activity_state.dart';
import 'package:soywarmi_app/presentation/bloc/news/get_news_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/news/get_news_state.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_state.dart';
import 'package:soywarmi_app/presentation/page/member_info_page.dart';
import 'package:soywarmi_app/presentation/page/news_details_screen.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_litle.dart';
import 'package:soywarmi_app/presentation/widget/image_container.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 8),
              child: Text(
                'Hola, Maria Gonzales!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8),
              child: Text(
                '¿Que tienes planeado para hoy?',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              children: [
                const CustomTextTitle(label: 'Noticias de SoyWarmi'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/news');
                  },
                  child: const Text(
                    'Ver todo',
                    style: TextStyle(
                      fontSize: 12,
                      color: NBSecondPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: SizedBox(
              height: 220,
              child: BlocBuilder<GetNewsCubit, GetNewsState>(
                bloc: sl<GetNewsCubit>()..getNews(),
                builder: (context, state) {
                  if (state is GetNewsLoaded) {
                    final news = state.news;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final newData = news[index];
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsDetailsScreen(news: newData)));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ImageContainer(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  imageUrl: newData.image,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  newData.title,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          height: 1.5),
                                ),
                                const SizedBox(height: 5),
                                Text('Hace ${DateTime.now().hour} horas',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                const SizedBox(height: 5),
                                Text('by SoyWarmi',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  if (state is GetNewsError) {
                    return const Center(child: Text('Error'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              children: [
                const CustomTextTitle(label: 'Miembros'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/members');
                  },
                  child: const Text(
                    'Ver todo',
                    style: TextStyle(
                      fontSize: 12,
                      color: NBSecondPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: SizedBox(
                height: 220,
                child: BlocBuilder<GetTeamsCubit, GetTeamsState>(
                  bloc: sl<GetTeamsCubit>()..getTeams(),
                  builder: (context, state) {
                    if (state is GetTeamsError) {
                      return const Center(
                          child: Text(
                              'No pudimos cargar los datos, vuelva a intentarlo'));
                    }
                    if (state is GetTeamsLoaded) {
                      final members = state.members;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: members.length > 10 ? 10 : members.length,
                        itemBuilder: (context, index) {
                          final member = members[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: NbSecondSecondaryColor,
                            ),
                            width: MediaQuery.of(context).size.width * 0.45,
                            margin: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MemberInfoPage(member: member)));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white,
                                      backgroundImage:
                                          Image.network(member.photo).image),
                                  const SizedBox(height: 10),
                                  Text(
                                    member.name,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5),
                                  ),
                                  const SizedBox(height: 5),
                                  Text('Voluntaria',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              children: [
                const CustomTextTitle(label: 'Actividades'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/activity');
                  },
                  child: const Text(
                    'Ver todo',
                    style: TextStyle(
                      fontSize: 12,
                      color: NBSecondPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: SizedBox(
              height: 220,
              child: BlocBuilder<GetActivityCubit, GetActivityState>(
                bloc: sl<GetActivityCubit>()..getActivity(),
                builder: (context, state) {
                  if (state is GetActivityLoaded) {
                    final activity = state.activity;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final activityData = activity[index];
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //carrusel
                                ImageContainer(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  imageUrl: activityData.images.isEmpty
                                      ? ''
                                      : activityData.images.first,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  activityData.name,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          height: 1.5),
                                ),
                                const SizedBox(height: 5),
                                Text('Hace ${DateTime.now().hour} horas',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                const SizedBox(height: 5),
                                
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  if (state is GetNewsError) {
                    return const Center(child: Text('Error'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
