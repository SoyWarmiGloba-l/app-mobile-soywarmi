import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soywarmi_app/data/model/medical_center_model.dart';
import 'package:soywarmi_app/data/remote/http_headers_global.dart';

abstract class MedicalCenterRemoteDataSource {
  Future<List<MedicalCenterModel>> getMedicalCenters();
}

class MedicalCenterRemoteDataSourceImplementation
    extends MedicalCenterRemoteDataSource {
  final _storage = const FlutterSecureStorage();
  final _endPoint = dotenv.env['API_ENDPOINT'];
  @override
  Future<List<MedicalCenterModel>> getMedicalCenters() async {
    final userToken = await _storage.read(key: 'USER_TOKEN');
    final req = await HttpHeadersGlobal.headerGetHttpWithToken(
        userToken, '$_endPoint/api/v1/medical_centers');

    if (req.statusCode == 200) {
      final medicalCenters = json.decode(req.body);
      final List<dynamic> listMedicalCenters = medicalCenters['data'];

      if (listMedicalCenters.isNotEmpty) {
        final List<MedicalCenterModel> listMedicalCentersModel =
            listMedicalCenters
                .map((e) => MedicalCenterModel.fromJson(e))
                .toList();
        return listMedicalCentersModel;
      } else {
        return [];
      }
    } else {
      throw Exception('Error al obtener los datos');
    }
  }
}
