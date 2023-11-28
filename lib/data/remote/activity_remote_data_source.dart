import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soywarmi_app/data/model/activity_model.dart';
import 'package:soywarmi_app/data/remote/http_headers_global.dart';

abstract class ActivityRemoteDataSource {
  Future<List<ActivityModel>> getActivities();
}

class ActivityRemoteDataSourceImplementation extends ActivityRemoteDataSource {
  final _storage = const FlutterSecureStorage();
  final _endPoint = dotenv.env['API_ENDPOINT'];
  @override
  Future<List<ActivityModel>> getActivities() async {
    try {
      final userToken = await _storage.read(key: 'USER_TOKEN');
    final req = await HttpHeadersGlobal.headerGetHttpWithToken(
        userToken, '$_endPoint/api/v1/activities');

    if (req.statusCode == 200) {
      final res = json.decode(req.body) ;
      final List<dynamic> listActivities = res['data'];

      if (listActivities.isNotEmpty) {
        final List<ActivityModel> listActivitiesModel =
            listActivities.map((e) => ActivityModel.fromJson(e)).toList();
        return listActivitiesModel;
      } else {
        return [];
      }
    } else {
      throw Exception('Error al obtener los datos');
    }
      
    } on Exception catch (e) {
      throw Exception('Error al obtener los datos $e');
      
    }
  }
}
