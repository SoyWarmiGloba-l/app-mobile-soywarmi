import 'package:get_it/get_it.dart';
import 'package:soywarmi_app/data/remote/doctor_remote_data_source.dart';
import 'package:soywarmi_app/data/remote/medical_center_remote_data_source.dart';
import 'package:soywarmi_app/data/remote/news_remote_data_source.dart';
import 'package:soywarmi_app/data/remote/team_remote_data_source.dart';
import 'package:soywarmi_app/data/repository/doctor_repository_implementation.dart';
import 'package:soywarmi_app/data/repository/medical_center_repository_implementation.dart';
import 'package:soywarmi_app/data/repository/news_repository_implementation.dart';
import 'package:soywarmi_app/data/repository/teams_repository_implementation.dart';
import 'package:soywarmi_app/domain/repository/doctor_repository.dart';
import 'package:soywarmi_app/domain/repository/medical_center_repository.dart';
import 'package:soywarmi_app/domain/repository/news_repository.dart';
import 'package:soywarmi_app/domain/repository/team_repository.dart';
import 'package:soywarmi_app/domain/usescase/doctor/get_doctor_usecase.dart';
import 'package:soywarmi_app/domain/usescase/medical_centers/get_medical_centers_usecase.dart';
import 'package:soywarmi_app/domain/usescase/news/get_news_usecase.dart';
import 'package:soywarmi_app/domain/usescase/team/get_teams_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/doctor/get_doctor_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/medical_centers/get_medical_centers_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/news/get_news_cubit.dart';
import 'package:soywarmi_app/presentation/bloc/team/get_teams_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //DataSource

  sl.registerFactory<DoctorRemoteDataSource>(
      () => DoctorRemoteDataSourceImplementation());

  sl.registerFactory<TeamRemoteDataSource>(
      () => TeamRemoteDataSourceImplementation());

  sl.registerFactory<MedicalCenterRemoteDataSource>(
      () => MedicalCenterRemoteDataSourceImplementation());

  sl.registerFactory<NewsRemoteDataSource>(() => NewsRemoteDataSourceImplementation());

  //Repository

  sl.registerFactory<DoctorRepository>(
      () => DoctorRepositoryImplementation(doctorRemoteDataSource: sl()));

  sl.registerFactory<TeamRepository>(
      () => TeamsRepositoryImplementation(teamRemoteDataSource: sl()));

  sl.registerFactory<MedicalCenterRepository>(() =>
      MedicalCenterRepositoryImplementation(
          medicalCenterRemoteDataSource: sl()));

  sl.registerFactory<NewsRepository>(() => NewsRepositoryImplementation(newsRemoteDataSource: sl()));

  //UseCase

  sl.registerFactory<GetDoctorUseCase>(
      () => GetDoctorUseCase(doctorRepository: sl()));

  sl.registerFactory<GetTeamsUseCase>(
      () => GetTeamsUseCase(teamRepository: sl()));

  sl.registerFactory<GetMedicalCentersUseCase>(
      () => GetMedicalCentersUseCase(medicalCenterRepository: sl()));

  
  sl.registerFactory<GetNewsUseCase>(() => GetNewsUseCase(newsRepository: sl()));

  //Bloc

  sl.registerSingleton<GetDoctorCubit>(GetDoctorCubit(getDoctorUseCase: sl()));

  sl.registerSingleton<GetTeamsCubit>(GetTeamsCubit(getTeamsUseCase: sl()));

  sl.registerSingleton<GetMedicalCentersCubit>(
      GetMedicalCentersCubit(getMedicalCentersUseCase: sl()));

  sl.registerSingleton<GetNewsCubit>( GetNewsCubit(getNewsUseCase: sl()));
}
