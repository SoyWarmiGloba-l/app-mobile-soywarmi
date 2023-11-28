import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/domain/entity/doctor_entity.dart';

abstract class GetDoctorsState extends Equatable {
  GetDoctorsState();

  final List<DoctorEntity>? doctors = [];

  @override
  List<Object> get props => [];
}

class GetDoctorsInitial extends GetDoctorsState {}

class GetDoctorsLoading extends GetDoctorsState {}

class GetDoctorsLoaded extends GetDoctorsState {
  @override
  final List<DoctorEntity> doctors;

  GetDoctorsLoaded({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

class GetDoctorsError extends GetDoctorsState {
  final String message;

  GetDoctorsError({required this.message});

  @override
  List<Object> get props => [message];
}
