import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/data/remote/activity_remote_data_source.dart';
import 'package:soywarmi_app/domain/entity/activity_entity.dart';
import 'package:soywarmi_app/domain/repository/activity_repository.dart';

class ActivityRepositoryImplementation extends ActivityRepository {
  ActivityRepositoryImplementation({required this.activityDataSource});

  final ActivityRemoteDataSource activityDataSource;
  @override
  Future<Either<ActivityFailure, List<ActivityEntity>>> getActivities() async {
    try {
      final activities = await activityDataSource.getActivities();

      final activitiesEntity = activities
          .map((e) => ActivityEntity(
                id: e.id,
                eventType: EventTypeEnity(
                    id: e.eventType.id,
                    title: e.eventType.title,
                    description: e.eventType.description,
                    createdAt: e.eventType.createdAt,
                    updatedAt: e.eventType.updatedAt,
                    deletedAt: e.eventType.deletedAt),
                description: e.description,
                eventTypeId: e.eventTypeId,
                name: e.name,
                endDate: e.endDate,
                step: e.step,
                area: e.area,
                requirement: e.requirement,
                images: e.images,
                deletedAt: e.deletedAt,
                createdAt: e.createdAt,
                updatedAt: e.updatedAt,
              ))
          .toList();
      return Future.value(right(activitiesEntity));
    } on Exception {
      return Future.value(
          left(ActivityFailure('Ha ocurrido un error inesperado.')));
    }
  }
}
