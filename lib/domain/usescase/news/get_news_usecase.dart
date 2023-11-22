import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/entity/news_entity.dart';
import 'package:soywarmi_app/domain/repository/news_repository.dart';

class GetNewsUseCase extends FutureUsesCase<List<NewsEntity>, NoParams> {
  GetNewsUseCase({
    required this.newsRepository,
  });

  final NewsRepository newsRepository;
  @override
  Future<Either<NewsFailure, List<NewsEntity>>> call(NoParams params) {
    return newsRepository.getNews();
  }
}
