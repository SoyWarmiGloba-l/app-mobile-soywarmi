import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/usescase/doctor/get_doctor_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/doctor/get_doctor_state.dart';

class GetDoctorCubit extends Cubit<GetDoctorsState> {
  GetDoctorCubit({
    required GetDoctorUseCase getDoctorUseCase,
  })  : _getDoctorUseCase = getDoctorUseCase,
        super(GetDoctorsInitial());

  final GetDoctorUseCase _getDoctorUseCase;

  Future<void> getDoctor() async {
    emit(GetDoctorsLoading());

    final result = await _getDoctorUseCase(
      NoParams(),
    );
    result.fold(
      (failure) => emit(GetDoctorsError(message: failure.message)),
      (doctors) => emit(GetDoctorsLoaded(doctors: doctors)),
    );
  }
}
