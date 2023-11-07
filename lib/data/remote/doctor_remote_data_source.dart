import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soywarmi_app/data/model/doctor_model.dart';
import 'package:http/http.dart' as http;
import 'package:soywarmi_app/data/remote/http_headers_global.dart';

abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
}

class DoctorRemoteDataSourceImplementation extends DoctorRemoteDataSource {
  final storage = const FlutterSecureStorage();
  final _endPoint = dotenv.env['API_ENDPOINT'];
  

  @override
  Future<List<DoctorModel>> getDoctors() async {
    final userToken = await storage.read(key: 'USER_TOKEN');
    
    final req = await HttpHeadersGlobal.headerGetHttpWithToken(userToken, '$_endPoint/api/v1/doctors');

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


