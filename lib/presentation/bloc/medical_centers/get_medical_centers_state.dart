import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/domain/entity/medical_center_entity.dart';

abstract class GetMedicalCentersState extends Equatable {
  const GetMedicalCentersState();

  @override
  List<Object> get props => [];
}

class GetMedicalCentersInitial extends GetMedicalCentersState {}

class GetMedicalCentersLoading extends GetMedicalCentersState {}

class GetMedicalCentersLoaded extends GetMedicalCentersState {
  final List<MedicalCenterEntity> medicalCenters;

  const GetMedicalCentersLoaded({required this.medicalCenters});

  @override
  List<Object> get props => [medicalCenters];
}

class GetMedicalCentersError extends GetMedicalCentersState {
  final String message;

  const GetMedicalCentersError({required this.message});

  @override
  List<Object> get props => [message];
}
