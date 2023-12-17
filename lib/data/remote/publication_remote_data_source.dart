import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soywarmi_app/data/model/publication_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:math';
import 'package:faker/faker.dart';

abstract class PublicationRemoteDataSource {
  Future<List<PublicationModel>> getPublications();
  Future<PublicationModel> getPublication(int id);
  Future<void> createPublication(PublicationModel publication);
  Future<void> updatePublication(PublicationModel publication);
  Future<void> deletePublication(int id);
}

class PublicationRemoteDaraSourceImplementation
    extends PublicationRemoteDataSource {
  final _storage = const FlutterSecureStorage();
  final _endPoint = dotenv.env['API_ENDPOINT'];

  final List<PublicationModel> listPublications = List.generate(5, (index) {
    final faker = Faker();
    final random = Random();

    return PublicationModel(
      id: index + 1,
      userId: random.nextInt(100), // IDs de usuarios aleatorios
      title: faker.lorem.sentence(),
      description: faker.lorem.sentences(2).join(' '),
      type: true,
      images: List.generate(
          3,
          (_) =>
              'https://picsum.photos/200/300'), // Imágenes aleatorias de Lorem Picsum
    );
  });
  @override
  Future<void> createPublication(PublicationModel publication) {
    // TODO: implement createPublication
    throw UnimplementedError();
  }

  @override
  Future<void> deletePublication(int id) {
    // TODO: implement deletePublication
    throw UnimplementedError();
  }

  @override
  Future<PublicationModel> getPublication(int id) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return listPublications.firstWhere((element) => element.id == id);
      },
    );
  }

  @override
  Future<List<PublicationModel>> getPublications() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return listPublications;
      },
    );
  }

  @override
  Future<void> updatePublication(PublicationModel publication) {
    // TODO: implement updatePublication
    throw UnimplementedError();
  }
}
