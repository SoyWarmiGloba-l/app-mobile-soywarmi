import 'package:bloc/bloc.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/usescase/publications/get_publications_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/publications/get_publications_state.dart';

class GetPublicationsCubit extends Cubit<GetPublicationsState> {
  GetPublicationsCubit({required this.getPublicatiosUseCase})
      : super(GetPublicationsInitial());

  final GetPublicatiosUseCase getPublicatiosUseCase;

  Future<void> getPublications() async {
    emit(GetPublicationsLoading());

    final result = await getPublicatiosUseCase(NoParams());

    result.fold(
      (failure) => emit(GetPublicationsError(message: failure.message)),
      (publications) => emit(GetPublicationsLoaded(publications: publications)),
    );
  }
}
