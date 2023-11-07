import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soywarmi_app/data/model/member_model.dart';
import 'package:soywarmi_app/data/remote/http_headers_global.dart';

abstract class TeamRemoteDataSource {
  Future<List<MemberModel>> getTeams();
}

class TeamRemoteDataSourceImplementation extends TeamRemoteDataSource {
  final _storage = const FlutterSecureStorage();
  final _endPoint = dotenv.env['API_ENDPOINT'];

  @override
  Future<List<MemberModel>> getTeams() async {
    final userToken = await _storage.read(key: 'USER_TOKEN');
    final req = await HttpHeadersGlobal.headerGetHttpWithToken(
        userToken, '$_endPoint/api/v1/teams');

    if (req.statusCode == 200) {
      final Map<String, dynamic> teams = json.decode(req.body);
      final List<dynamic> listTeams = teams['data'];
      if (listTeams.isNotEmpty) {
        final List<MemberModel> listTeamsModel =
            listTeams.map((e) => MemberModel.fromJson(e)).toList();
        return listTeamsModel;
      } else {
        return [];
      }
    } else {
      throw Exception('Error al obtener los datos');
    }
  }
}
