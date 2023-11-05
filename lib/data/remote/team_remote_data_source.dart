import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soywarmi_app/data/model/member_model.dart';

abstract class TeamRemoteDataSource {
  Future<List<MemberModel>> getTeams();
}

class TeamRemoteDataSourceImplementation extends TeamRemoteDataSource {
  final _endPoint = dotenv.env['API_ENDPOINT'];
  final _userToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NveXdhcm1pLnJkYS1jb25zdWx0b3Jlcy5jb20vYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2OTkxOTM2NDMsImV4cCI6MTY5OTE5NzI0MywibmJmIjoxNjk5MTkzNjQzLCJqdGkiOiJYa0JrNERhbGRmSjJtYXl2Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.B_hDlDmMELaZ-kCDuypXvVCQxpXXbifQ0eU3iUMrwYQ';
  @override
  Future<List<MemberModel>> getTeams() async {
    final req = await GetHttpHeader()
        .headerHttpWithToken(_userToken, '$_endPoint/api/v1/teams');

    if (req.statusCode == 200) {
      final Map<String, dynamic> teams = json.decode(req.body);
      final List<dynamic> listTeams = teams['data'];
      print('listTeams: $listTeams');
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

class GetHttpHeader {
  Future<http.Response> headerHttpWithToken(token, url) async {
    http.Response req = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": 'application/json',
        "Authorization": 'Bearer $token',
      },
    );
    return req;
  }
}
