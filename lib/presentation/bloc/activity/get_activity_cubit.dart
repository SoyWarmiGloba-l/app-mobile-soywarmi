

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/usescase/activity/get_activity_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/activity/get_activity_state.dart';

class GetActivityCubit extends Cubit<GetActivityState> {
  GetActivityCubit({required this.getActivityUseCase}) : super(GetActivityInitial());

  final GetActivityUseCase getActivityUseCase;

  Future<void> getActivity() async {
    emit(GetActivityLoading());
    final activity = await getActivityUseCase.call(NoParams());
    emit(activity.fold(
      (failure) => GetActivityError(message: failure.toString()),
      (activity) => GetActivityLoaded(activity: activity),
    ));
  }
}