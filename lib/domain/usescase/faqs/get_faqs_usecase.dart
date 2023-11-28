import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/entity/faqs_entity.dart';
import 'package:soywarmi_app/domain/repository/faqs_repository.dart';

class GetFaqsUseCase extends FutureUsesCase<List<FaqsEntity>, NoParams> {
  final FaqsRepository faqsRepository;

  GetFaqsUseCase({required this.faqsRepository});

  @override
  Future<Either<FaqsFailure, List<FaqsEntity>>> call(NoParams params) {
    return faqsRepository.getFaqs();
  }
}
