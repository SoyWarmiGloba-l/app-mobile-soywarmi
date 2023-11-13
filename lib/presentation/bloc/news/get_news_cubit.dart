

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/usescase/news/get_news_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/news/get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {

  GetNewsCubit({
    required this.getNewsUseCase,
  }) : super(GetNewsInitial());


  final GetNewsUseCase getNewsUseCase;


  Future<void> getNews() async {
    emit(GetNewsLoading());
    final failureOrNews =
    await getNewsUseCase.call(NoParams());
    failureOrNews.fold(
          (failure) => emit(GetNewsError(message: failure.message)),
          (news) =>
          emit(GetNewsLoaded(news: news)),
    );
  } 
}