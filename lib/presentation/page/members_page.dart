import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_state.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_field.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NBColorWhite,
        elevation: 0,
        title: const Text('Todos los miembros',
            style: TextStyle(color: NBPrimaryColor)),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 2),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomTextField(
            label: 'Buscar.....',
            icon: Icons.search,
          ),
          Expanded(
              child: BlocBuilder<GetTeamsCubit, GetTeamsState>(
            bloc: sl<GetTeamsCubit>()..getTeams(),
            builder: (context, state) {
              if (state is GetTeamsLoaded) {
                final teams = state.members;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    final team = teams[index];
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
                                    Image.network(team.photo).image),
                            const SizedBox(height: 10),
                            Text(
                              team.name,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold, height: 1.5),
                            ),
                            const SizedBox(height: 5),
                            Text('Voluntaria',
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              if (state is GetTeamsError) {
                return const Center(
                    child: Text('Error al cargar los miembros'));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ))
        ]),
      ),
    );
  }
}
