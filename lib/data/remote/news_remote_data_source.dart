import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soywarmi_app/data/model/news_model.dart';
import 'package:soywarmi_app/data/remote/http_headers_global.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImplementation extends NewsRemoteDataSource {
  final _storage = const FlutterSecureStorage();
  final _endPoint = dotenv.env['API_ENDPOINT'];
  @override
  Future<List<NewsModel>> getNews() async {
    final userToken = await _storage.read(key: 'USER_TOKEN');
    final req = await HttpHeadersGlobal.headerGetHttpWithToken(
        userToken, '$_endPoint/api/v1/news');

    if (req.statusCode == 200) {
      final newsResponse = jsonDecode(req.body);
      final List<dynamic> listNews = newsResponse['data'];

      if (listNews.isNotEmpty) {
        final List<NewsModel> listNewsModel =
            listNews.map((e) => NewsModel.fromJson(e)).toList();
        return listNewsModel;
      } else {
        return [];
      }
    } else {
      throw Exception('Error al obtener los datos');
    }
  }
}
