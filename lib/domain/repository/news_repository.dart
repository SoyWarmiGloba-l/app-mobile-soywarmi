import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/domain/entity/news_entity.dart';

abstract class NewsRepository {
  Future<Either<NewsFailure, List<NewsEntity>>> getNews();
}