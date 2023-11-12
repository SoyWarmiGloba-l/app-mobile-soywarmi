import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/usescase/medical_centers/get_medical_centers_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/medical_centers/get_medical_centers_state.dart';

class GetMedicalCentersCubit extends Cubit<GetMedicalCentersState> {
  GetMedicalCentersCubit({
    required this.getMedicalCentersUseCase,
  }) : super(GetMedicalCentersInitial());

  final GetMedicalCentersUseCase getMedicalCentersUseCase;

  Future<void> getMedicalCenters() async {
    emit(GetMedicalCentersLoading());
    final failureOrMedicalCenters =
        await getMedicalCentersUseCase.call(NoParams());
    failureOrMedicalCenters.fold(
      (failure) => emit(GetMedicalCentersError(message: failure.message)),
      (medicalCenters) =>
          emit(GetMedicalCentersLoaded(medicalCenters: medicalCenters)),
    );
  }
}
