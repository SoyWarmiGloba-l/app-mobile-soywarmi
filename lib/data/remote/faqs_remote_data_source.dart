import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soywarmi_app/data/model/faq_model.dart';
import 'package:soywarmi_app/data/remote/http_headers_global.dart';

abstract class FaqsRemoteDataSource {
  Future<List<FaqsModel>> getFaqs();
}

class FaqsRemoteDataSourceImplementation implements FaqsRemoteDataSource {
  final _storage = const FlutterSecureStorage();
  final _endPoint = dotenv.env['API_ENDPOINT'];
  @override
  Future<List<FaqsModel>> getFaqs() async {
    final userToken = await _storage.read(key: 'USER_TOKEN');
    final req = await HttpHeadersGlobal.headerGetHttpWithToken(
        userToken, '$_endPoint/api/v1/faqs');

    if (req.statusCode == 200) {
      print('req.body ${req.body}');
    }else 
    {
      print('no hay datos');
    }

    return [];
  }
}
