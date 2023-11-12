

import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/domain/entity/medical_center_entity.dart';

abstract class MedicalCenterRepository {
  Future<Either<MedicalCenterFailure, List<MedicalCenterEntity>>> getMedicalCenters();
}