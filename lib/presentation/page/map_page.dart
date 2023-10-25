import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_litle.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController mapController = MapController();
  LatLng default_position = LatLng(-17.419869, -66.129660);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            minZoom: 13,
            maxZoom: 18,
            initialCenter: default_position,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: width * 0.7,
          bottom: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(NBSecondPrimaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                _showCityModal(context);
              },
              child: Text(
                'Cambiar ciudad',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: width * 0.7,
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(NBSecondPrimaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                _showModalNearestHospitalsl(context);
              },
              child: Text(
                'Mostrar mas cercanos',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        )
      ],
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
              child: const Center(
                child: Column(
                  children: [
                    Align(
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
              child: const Center(
                child: Column(
                  children: [
                    Align(
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
