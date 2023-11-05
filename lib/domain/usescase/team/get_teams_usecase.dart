import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/entity/member_entity.dart';
import 'package:soywarmi_app/domain/repository/team_repository.dart';

class GetTeamsUseCase extends FutureUsesCase<List<MemberEntity>, NoParams> {
  GetTeamsUseCase({
    required this.teamRepository,
  });

  final TeamRepository teamRepository;
  @override
  Future<Either<TeamFailure, List<MemberEntity>>> call(NoParams params)   {
    return  teamRepository.getTeams();
  }
}