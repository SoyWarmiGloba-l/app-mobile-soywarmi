

import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/domain/entity/doctor_entity.dart';

abstract class DoctorRepository {
  Future<Either<DoctorFailure, List<DoctorEntity>>> getDoctors();
}