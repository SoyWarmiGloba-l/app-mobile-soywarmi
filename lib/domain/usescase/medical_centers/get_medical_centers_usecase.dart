import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/entity/medical_center_entity.dart';
import 'package:soywarmi_app/domain/repository/medical_center_repository.dart';

class GetMedicalCentersUseCase extends FutureUsesCase<List<MedicalCenterEntity>, NoParams> {
  GetMedicalCentersUseCase({
    required this.medicalCenterRepository,
  });

  final MedicalCenterRepository medicalCenterRepository;
  @override
  Future<Either<MedicalCenterFailure, List<MedicalCenterEntity>>> call(NoParams params) {
    return medicalCenterRepository.getMedicalCenters();
  }
}
