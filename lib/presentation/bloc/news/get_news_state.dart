import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/domain/entity/news_entity.dart';

abstract class GetNewsState extends Equatable {
  const GetNewsState();

  @override
  List<Object> get props => [];
}

class GetNewsInitial extends GetNewsState {}

class GetNewsLoading extends GetNewsState {}

class GetNewsLoaded extends GetNewsState {
  final List<NewsEntity> news;

  const GetNewsLoaded({required this.news});

  @override
  List<Object> get props => [news];
}

class GetNewsError extends GetNewsState {
  final String message;

  const GetNewsError({required this.message});

  @override
  List<Object> get props => [message];
}
