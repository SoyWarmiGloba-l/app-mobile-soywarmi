import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soywarmi_app/data/model/doctor_model.dart';
import 'package:http/http.dart' as http;

abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
}

class DoctorRemoteDataSourceImplementation extends DoctorRemoteDataSource {
  final _endPoint = dotenv.env['API_ENDPOINT'];
  final _userToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NveXdhcm1pLnJkYS1jb25zdWx0b3Jlcy5jb20vYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2OTkyMDc3MjYsImV4cCI6MTY5OTIxMTMyNiwibmJmIjoxNjk5MjA3NzI2LCJqdGkiOiJYWEh5ZDFRWmV2MEk1SGs3Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.gy7Delsk4eMOF92_B5_rBFHbGs6nxZ0bN_YmRUpd89Y';
  @override
  Future<List<DoctorModel>> getDoctors() async {
    final req = await GetHttpHeader()
        .headerHttpWithToken(_userToken, '$_endPoint/api/v1/doctors');

    if (req.statusCode == 200) {
      final Map<String, dynamic> doctors = json.decode(req.body);

      final List<dynamic> listDoctors = doctors['data'];

      if (listDoctors.isNotEmpty) {
        final List<DoctorModel> listDoctorsModel =
            listDoctors.map((e) => DoctorModel.fromJson(e)).toList();

        return listDoctorsModel;
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
