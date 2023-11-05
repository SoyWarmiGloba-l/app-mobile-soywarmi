import 'package:get_it/get_it.dart';
import 'package:soywarmi_app/data/remote/doctor_remote_data_source.dart';
import 'package:soywarmi_app/data/remote/team_remote_data_source.dart';
import 'package:soywarmi_app/data/repository/doctor_repository_implementation.dart';
import 'package:soywarmi_app/data/repository/teams_repository_implementation.dart';
import 'package:soywarmi_app/domain/repository/doctor_repository.dart';
import 'package:soywarmi_app/domain/repository/team_repository.dart';
import 'package:soywarmi_app/domain/usescase/doctor/get_doctor_usecase.dart';
import 'package:soywarmi_app/domain/usescase/team/get_teams_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/doctor/get_doctor_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //DataSource

  sl.registerFactory<DoctorRemoteDataSource>(
      () => DoctorRemoteDataSourceImplementation());

  sl.registerFactory<TeamRemoteDataSource>(() => TeamRemoteDataSourceImplementation());
  //Repository

  sl.registerFactory<DoctorRepository>(
      () => DoctorRepositoryImplementation(doctorRemoteDataSource: sl()));

  sl.registerFactory<TeamRepository>(() => TeamsRepositoryImplementation(teamRemoteDataSource: sl()));

  //UseCase

  sl.registerFactory<GetDoctorUseCase>(
      () => GetDoctorUseCase(doctorRepository: sl()));

  sl.registerFactory<GetTeamsUseCase>(() => GetTeamsUseCase(teamRepository: sl()));

  //Bloc

  sl.registerSingleton<GetDoctorCubit>(GetDoctorCubit(getDoctorUseCase: sl()));

  sl.registerSingleton<GetTeamsCubit>(GetTeamsCubit(getTeamsUseCase: sl()));
}
