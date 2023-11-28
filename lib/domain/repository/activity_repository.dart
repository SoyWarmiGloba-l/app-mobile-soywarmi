import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/domain/entity/activity_entity.dart';

abstract class ActivityRepository {
  Future<Either<ActivityFailure, List<ActivityEntity>>> getActivities();
}