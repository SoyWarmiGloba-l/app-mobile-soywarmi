import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/data/remote/medical_center_remote_data_source.dart';
import 'package:soywarmi_app/domain/entity/medical_center_entity.dart';
import 'package:soywarmi_app/domain/repository/medical_center_repository.dart';

class MedicalCenterRepositoryImplementation extends MedicalCenterRepository {
  MedicalCenterRepositoryImplementation({
    required this.medicalCenterRemoteDataSource,
  });

  final MedicalCenterRemoteDataSource medicalCenterRemoteDataSource;

  @override
  Future<Either<MedicalCenterFailure, List<MedicalCenterEntity>>>
      getMedicalCenters() async {
    try {
      final medicalCenterModel =
          await medicalCenterRemoteDataSource.getMedicalCenters();

      final medicalCenterEntity = medicalCenterModel.map((e) {

        final doubleLat = double.parse(e.latitude) ;
        final doubleLong = double.parse(e.longitude) ;

        print("------------latitud: ${doubleLat}  longitud: ${e.longitude}");
        return MedicalCenterEntity(
            id: e.id,
            name: e.name,
            longitude: doubleLong,
            latitude: doubleLat,
            description: e.description,
            openingDate: e.openingDate,
            closingDate: e.closingDate,
            phones: e.phones,
            medicalServices: const [],
            createdAt: e.createdAt,
            updatedAt: e.updatedAt,
            deletedAt: e.deletedAt);
      });

      return Right(medicalCenterEntity.toList());
    } on Exception {
      return Left(MedicalCenterFailure('Error al obtener los centros médicos'));
    }
  }
}
