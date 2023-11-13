import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/inyection_container.dart';
import 'package:soywarmi_app/presentation/bloc/doctor/get_doctor_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/doctor/get_doctor_state.dart';
import 'package:soywarmi_app/presentation/page/doctor_info_page.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_field.dart';
import 'package:soywarmi_app/presentation/widget/doctor_card.dart';

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
            colored: true,
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
              return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error al cargar los datos, intente nuevamente'),
                  IconButton(
                    onPressed: () {
                      sl<GetDoctorCubit>().getDoctor();
                    },
                    icon:  Icon(Icons.refresh, color: Theme.of(context).primaryColor,),
                  )
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        )),
      ],
    );
  }
}
