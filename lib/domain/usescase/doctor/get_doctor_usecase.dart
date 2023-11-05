import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/entity/doctor_entity.dart';
import 'package:soywarmi_app/domain/repository/doctor_repository.dart';

class GetDoctorUseCase extends FutureUsesCase<List<DoctorEntity>, NoParams> {
  GetDoctorUseCase({
    required this.doctorRepository,
  });

  final DoctorRepository doctorRepository;
  @override
  Future<Either<DoctorFailure, List<DoctorEntity>>> call(NoParams params) {
    return doctorRepository.getDoctors();
  }
}
