
import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/domain/entity/publications_entity.dart';

abstract class GetPublicationsState extends Equatable {
  const GetPublicationsState();

  @override
  List<Object> get props => [];
}

class GetPublicationsInitial extends GetPublicationsState {}

class GetPublicationsLoading extends GetPublicationsState {}

class GetPublicationsLoaded extends GetPublicationsState {
  final List<PublicationEntity> publications;

  const GetPublicationsLoaded({required this.publications});

  @override
  List<Object> get props => [publications];
}

class GetPublicationsError extends GetPublicationsState {
  final String message;

  const GetPublicationsError({required this.message});

  @override
  List<Object> get props => [message];
}