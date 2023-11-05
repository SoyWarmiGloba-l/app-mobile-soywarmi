import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/usescase/team/get_teams_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {

  GetTeamsCubit({
    required GetTeamsUseCase getTeamsUseCase,
  })  : _getTeamsUseCase = getTeamsUseCase,
        super(GetTeamsInitial());

  final GetTeamsUseCase _getTeamsUseCase;


  Future<void> getTeams() async {
    emit(GetTeamsLoading());

    final result = await _getTeamsUseCase(
      NoParams(),
    );
    result.fold(
      (failure) => emit(GetTeamsError(message: failure.message)),
      (members) => emit(GetTeamsLoaded(members: members)),
    );
  }

 
}
