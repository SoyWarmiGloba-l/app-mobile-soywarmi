import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/data/remote/publication_remote_data_source.dart';
import 'package:soywarmi_app/domain/entity/publications_entity.dart';
import 'package:soywarmi_app/domain/repository/publications_repository.dart';

class PublicationsRepositoryImplementation extends PublicationsRepository {
  PublicationsRepositoryImplementation({
    required this.publicationRemoteDataSource,
  });

  final PublicationRemoteDataSource publicationRemoteDataSource;
  @override
  Future<Either<PublicationsFailure, void>> createPublication(
      PublicationEntity publication) {
    // TODO: implement createPublication
    throw UnimplementedError();
  }

  @override
  Future<Either<PublicationsFailure, void>> deletePublication(int id) {
    // TODO: implement deletePublication
    throw UnimplementedError();
  }

  @override
  Future<Either<PublicationsFailure, PublicationEntity>> getPublication(
      int id) {
    // TODO: implement getPublication
    throw UnimplementedError();
  }

  @override
  Future<Either<PublicationsFailure, List<PublicationEntity>>>
      getPublications() async {
    try {
      final publications = await publicationRemoteDataSource.getPublications();
      final publicationsEntity = publications
          .map((publication) => PublicationEntity(
              id: publication.id,
              userId: publication.userId,
              title: publication.title,
              description: publication.description,
              type: publication.type,
              images: publication.images))
          .toList();
      return right(publicationsEntity);
    } on Exception {
      return left(PublicationsFailure('Error al obtener las publicaciones'));
    }
  }

  @override
  Future<Either<PublicationsFailure, void>> updatePublication(
      PublicationEntity publication) {
    // TODO: implement updatePublication
    throw UnimplementedError();
  }
}
