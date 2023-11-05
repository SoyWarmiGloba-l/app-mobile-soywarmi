import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/presentation/bloc/doctor/get_doctor_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/doctor/get_doctor_state.dart';
import 'package:soywarmi_app/presentation/page/doctor_info_page.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_field.dart';
import 'package:soywarmi_app/presentation/widget/doctor_card.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class SpecialistsPage extends StatefulWidget {
  const SpecialistsPage({super.key});

  @override
  State<SpecialistsPage> createState() => _SpecialistsPageState();
}

class _SpecialistsPageState extends State<SpecialistsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 2),
          child: CustomTextField(
            label: 'Buscar.....',
            icon: Icons.search,
          ),
        ),
        Expanded(
            child: BlocBuilder<GetDoctorCubit, GetDoctorsState>(
          bloc: sl<GetDoctorCubit>()..getDoctor(),
          builder: (context, state) {
            if (state is GetDoctorsLoaded) {
              final doctors = state.doctors;

              return ListView.builder(
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return DoctorCard(
                    doctor: doctor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorInfoPage(
                            doctor: doctor,
                          ),
                        ),
                      );
                    },
                  );
                },
                itemCount: doctors.length,
              );
            }
            if (state is GetDoctorsError) {
              return const Center(child: Text('No pudimos cargar los datos'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        )),
      ],
    );
  }
}
