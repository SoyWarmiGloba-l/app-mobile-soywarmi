import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/data/remote/doctor_remote_data_source.dart';
import 'package:soywarmi_app/domain/entity/doctor_entity.dart';
import 'package:soywarmi_app/domain/repository/doctor_repository.dart';

class DoctorRepositoryImplementation extends DoctorRepository {
  DoctorRepositoryImplementation({
    required this.doctorRemoteDataSource,
  });

  final DoctorRemoteDataSource doctorRemoteDataSource;
  @override
  Future<Either<DoctorFailure, List<DoctorEntity>>> getDoctors() async {
    try {
      final doctors = await doctorRemoteDataSource.getDoctors();
      final entityDoctors = doctors
          .map((e) => DoctorEntity(
              id: e.id,
              name: e.name,
              lastName: e.lastName,
              motherLastname: e.motherLastname,
              birthday: e.birthday,
              gender: e.gender,
              phoneNumber: e.phone,
              specialty: e.specialty,
              university: e.university,
              email: e.email,
              photo: e.photo,
              phone: e.phone,
              createdAt: e.createdAt,
              updatedAt: e.updatedAt,
              deletedAt: e.deletedAt))
          .toList();
      return Right(entityDoctors);
    } on Exception {
      return Left(DoctorFailure('Error al obtener los doctores'));
    }
  }
}
