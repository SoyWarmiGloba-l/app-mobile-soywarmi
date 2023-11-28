import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/domain/entity/activity_entity.dart';

abstract class GetActivityState extends Equatable {
  const GetActivityState();
}

class GetActivityInitial extends GetActivityState {
  @override
  List<Object> get props => [];
}

class GetActivityLoading extends GetActivityState {
  @override
  List<Object> get props => [];
}

class GetActivityLoaded extends GetActivityState {
  final List<ActivityEntity> activity;

  const GetActivityLoaded({required this.activity});

  @override
  List<Object> get props => [activity];
}

class GetActivityError extends GetActivityState {
  final String message;

  const GetActivityError({required this.message});

  @override
  List<Object> get props => [message];
}
