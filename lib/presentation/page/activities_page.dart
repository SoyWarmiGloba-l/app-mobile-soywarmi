import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/domain/entity/activity_entity.dart';
import 'package:soywarmi_app/presentation/bloc/activity/get_activity_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/activity/get_activity_state.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NBColorWhite,
        elevation: 0,
        title: const Text('Actividades SoyWarmi',
            style: TextStyle(color: NBPrimaryColor)),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Container(
          child: BlocBuilder<GetActivityCubit, GetActivityState>(
        bloc: sl<GetActivityCubit>()..getActivity(),
        builder: (context, state) {
          if (state is GetActivityError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).primaryColor,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'No se pudo cargar las actividades',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            );
          }

          if (state is GetActivityLoaded) {
            final activity = state.activity;

            return ListView.builder(
                itemCount: activity.length,
                itemBuilder: (context, index) {
                  final images = [NbLogoPost, NbLogoPost, NbLogoPost];
                  return Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(children: [
                        CarouselSlider(
                            options: CarouselOptions(
                              height: 200.0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              pauseAutoPlayOnTouch: true,
                              aspectRatio: 2.0,
                            ),
                            items: activity[index].images.isEmpty
                                ? images.map((item) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              //border˝

                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(
                                              item,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList()
                                : activity[index].images.map((item) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.amber,
                                          ),
                                          child: Image.network(
                                            item,
                                            fit: BoxFit.fill,
                                          ),
                                        );
                                      },
                                    );
                                  }).toList()),
                        const SizedBox(height: 10),
                        Text(
                          activity[index].name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Fecha de inicio: ${activity[index].createdAt}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Fecha de fin: ${activity[index].endDate}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Descripción: ${activity[index].description}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ]));
                });
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
