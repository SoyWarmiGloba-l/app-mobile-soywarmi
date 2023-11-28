

import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/domain/entity/faqs_entity.dart';

abstract class GetFaqsState extends Equatable {
  const GetFaqsState();
}

class GetFaqsInitial extends GetFaqsState {
  @override
  List<Object> get props => [];
}

class GetFaqsLoading extends GetFaqsState {
  @override
  List<Object> get props => [];
}

class GetFaqsLoaded extends GetFaqsState {
  final List<FaqsEntity> faqs;

  const GetFaqsLoaded({required this.faqs});

  @override
  List<Object> get props => [faqs];
}

class GetFaqsError extends GetFaqsState {
  final String message;

  const GetFaqsError({required this.message});

  @override
  List<Object> get props => [message];
}