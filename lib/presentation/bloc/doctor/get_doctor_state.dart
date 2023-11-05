import 'package:equatable/equatable.dart';

abstract class GetDoctorsState extends Equatable {
  const GetDoctorsState();

  @override
  List<Object> get props => [];
}

class GetDoctorsInitial extends GetDoctorsState {}

class GetDoctorsLoading extends GetDoctorsState {}

class GetDoctorsLoaded extends GetDoctorsState {
  final List<dynamic> doctors;

  const GetDoctorsLoaded({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

class GetDoctorsError extends GetDoctorsState {
  final String message;

  const GetDoctorsError({required this.message});

  @override
  List<Object> get props => [message];
}