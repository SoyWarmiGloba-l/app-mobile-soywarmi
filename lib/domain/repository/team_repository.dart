import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/domain/entity/member_entity.dart';

abstract class TeamRepository {
  Future<Either<TeamFailure, List<MemberEntity>>> getTeams();
}