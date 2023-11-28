import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/data/remote/faqs_remote_data_source.dart';
import 'package:soywarmi_app/domain/entity/faqs_entity.dart';
import 'package:soywarmi_app/domain/repository/faqs_repository.dart';

class FaqsRepositoryImplementation implements FaqsRepository {
  final FaqsRemoteDataSource faqsDataSource;

  FaqsRepositoryImplementation({required this.faqsDataSource});

  @override
  Future<Either<FaqsFailure, List<FaqsEntity>>> getFaqs() async {
    try {
      final faqs = await faqsDataSource.getFaqs();

      final faqsEntity = faqs
          .map((e) =>
              FaqsEntity(id: e.id, question: e.question, answer: e.answer))
          .toList();
      return right(faqsEntity);
    } on Exception {
      return left(FaqsFailure('Ha ocurrido un error inesperado.'));
    }
  }
}
