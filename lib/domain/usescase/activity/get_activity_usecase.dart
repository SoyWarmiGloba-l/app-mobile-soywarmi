import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/entity/activity_entity.dart';
import 'package:soywarmi_app/domain/repository/activity_repository.dart';

class GetActivityUseCase
    extends FutureUsesCase<List<ActivityEntity>, NoParams> {
  GetActivityUseCase({required this.activityRepository});

  final ActivityRepository activityRepository;
  @override
  Future<Either<ActivityFailure, List<ActivityEntity>>> call(NoParams params) {
    return activityRepository.getActivities();
  }
}
