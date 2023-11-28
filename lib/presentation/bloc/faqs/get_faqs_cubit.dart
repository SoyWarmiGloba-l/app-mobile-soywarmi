import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/usescase/faqs/get_faqs_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/faqs/get_faqs_state.dart';

class GetFaqsCubit extends Cubit<GetFaqsState> {
  GetFaqsCubit({required this.getFaqsUseCase}) : super(GetFaqsInitial());

  final GetFaqsUseCase getFaqsUseCase;

  Future<void> getFaqs() async {
    emit(GetFaqsLoading());
    final faqs = await getFaqsUseCase.call(NoParams());
    emit(faqs.fold(
      (failure) => GetFaqsError(message: failure.toString()),
      (faqs) => GetFaqsLoaded(faqs: faqs),
    ));
  }
}
