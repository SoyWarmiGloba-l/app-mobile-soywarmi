
import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/domain/entity/faqs_entity.dart';

abstract class FaqsRepository {
  Future<Either<FaqsFailure, List<FaqsEntity>>> getFaqs();
}