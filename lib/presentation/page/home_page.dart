import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_state.dart';
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
    return Column(
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
                onPressed: () {},
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                          width: MediaQuery.of(context).size.width * 0.5,
                          imageUrl: NbLogoPost,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Charla de emprendimiento',
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, height: 1.5),
                        ),
                        const SizedBox(height: 5),
                        Text('Hace ${DateTime.now().hour} horas',
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 5),
                        Text('by SoyWarmi',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                );
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
                onPressed: () {},
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
                            onTap: () {},
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
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
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
      ],
    );
  }
}
