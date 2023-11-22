import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soywarmi_app/data/model/post_model.dart';
import 'package:soywarmi_app/data/remote/http_headers_global.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataSourceImplementation extends PostRemoteDataSource {
  final _storage = const FlutterSecureStorage();
  final _endPoint = dotenv.env['API_ENDPOINT'];
  @override
  Future<List<PostModel>> getPosts() async {
    final userToken = await _storage.read(key: 'USER_TOKEN');
    final req = await HttpHeadersGlobal.headerGetHttpWithToken(
        userToken, '$_endPoint/api/v1/medical_centers');

    if (req.statusCode == 200) {
      final res = req.body;
      print('llegaaaaaaaa  ${res}');
    } else {
      throw Exception('Error al obtener los datos');
    }

    return [];
  }
}
