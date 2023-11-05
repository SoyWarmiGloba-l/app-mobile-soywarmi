import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/data/remote/team_remote_data_source.dart';
import 'package:soywarmi_app/domain/entity/member_entity.dart';
import 'package:soywarmi_app/domain/repository/team_repository.dart';

class TeamsRepositoryImplementation extends TeamRepository {
  TeamsRepositoryImplementation({
    required this.teamRemoteDataSource,
  });

  final TeamRemoteDataSource teamRemoteDataSource;

  @override
  Future<Either<TeamFailure, List<MemberEntity>>> getTeams() async {
    try {
      final teamModel = await teamRemoteDataSource.getTeams();

      final listTeams = teamModel.map((e) => MemberEntity(
          id: e.id,
          name: e.name,
          lastName: e.lastName,
          motherLastname: e.motherLastname,
          birthday: e.birthday,
          gender: e.gender,
          email: e.email,
          photo: e.photo,
          phone: e.phone,
          createdAt: e.createdAt,
          updatedAt: e.updatedAt,
          deletedAt: e.deletedAt,
          description: e.description,
          role: e.rolEquipo,
          socialNetworks: e.socialNetworks)).toList();
      
      return Right(listTeams);
    } on Exception {
      return Left(TeamFailure('Error al obtener los equipos'));
    }
  }
}
