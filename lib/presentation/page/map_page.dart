import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/data/remote/activity_remote_data_source.dart';
import 'package:soywarmi_app/data/remote/faqs_remote_data_source.dart';
import 'package:soywarmi_app/data/remote/medical_center_remote_data_source.dart';
import 'package:soywarmi_app/data/remote/news_remote_data_source.dart';
import 'package:soywarmi_app/presentation/bloc/medical_centers/get_medical_centers_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/medical_centers/get_medical_centers_state.dart';

import 'package:soywarmi_app/utilities/nb_colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final default_position = LatLng(-17.419869, -66.129660);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<GetMedicalCentersCubit, GetMedicalCentersState>(
      bloc: sl<GetMedicalCentersCubit>()..getMedicalCenters(),
      builder: (context, state) {
        if (state is GetMedicalCentersLoaded) {
          final medicalCenters = state.medicalCenters;
          final markers = medicalCenters.map((e) {
            final LatLng position = LatLng(e.latitude, e.longitude);
            return Marker(
              markerId: MarkerId(e.id.toString()),
              position: position,
              infoWindow: InfoWindow(
                title: e.name,
              ),
            );
          }).toSet();
          return Stack(
            children: [
              GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: markers,
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(-64.357902, -33.797913), zoom: 18)),
              Positioned(
                left: 0,
                right: width * 0.6,
                bottom: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          NBSecondPrimaryColor),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      // _showCityModal(context);
                      final res = ActivityRemoteDataSourceImplementation();
                      final data = res.getActivities();
                    },
                    child: const Text(
                      'Cambiar ciudad',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: width * 0.6,
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          NBSecondPrimaryColor),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      _showModalNearestHospitalsl(context);
                    },
                    child: const Text(
                      'Mostrar mas cercanos',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              )
            ],
          );
        }

        if (state is GetMedicalCentersError) {
          return const Center(child: Text('Error'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

void _showCityModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Center(
                child: Column(
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Cambia de ciudad',
                          style: TextStyle(
                            fontSize: 18,
                            color: NBSecondPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('La Paz'),
                              const Spacer(),
                              Checkbox(
                                  value: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  onChanged: (value) {}),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

void _showModalNearestHospitalsl(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Center(
                child: Column(
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Hospitales mas cercanos',
                          style: TextStyle(
                            fontSize: 18,
                            color: NBSecondPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: NbSecondSecondaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Image.asset('assets/images/hospital_icon.png'),
                        title: Text(
                          'Hospital 1',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        subtitle: Text(
                          'Av Heroinas ',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
