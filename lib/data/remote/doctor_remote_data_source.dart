import 'package:soywarmi_app/data/model/doctor_model.dart';

abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
}

class DoctorRemoteDataSourceImplementation extends DoctorRemoteDataSource {
  @override
  Future<List<DoctorModel>> getDoctors() async {
    return [];
  }
}
