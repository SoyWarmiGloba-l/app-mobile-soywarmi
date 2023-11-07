import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/domain/entity/member_entity.dart';

abstract class GetTeamsState extends Equatable {
  const GetTeamsState();

  @override
  List<Object> get props => [];
}

class GetTeamsInitial extends GetTeamsState {}

class GetTeamsLoading extends GetTeamsState {}

class GetTeamsLoaded extends GetTeamsState {
  final List<MemberEntity> members;

  const GetTeamsLoaded({required this.members});

  @override
  List<Object> get props => [members];
}

class GetTeamsError extends GetTeamsState {
  final String message;

  const GetTeamsError({required this.message});

  @override
  List<Object> get props => [message];
}