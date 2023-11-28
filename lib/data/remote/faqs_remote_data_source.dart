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
        userToken, '$_endPoint/api/v1/activities');

    if (req.statusCode == 200) {
      final res = req.body;
      print('req.body ${req.body}');
    } else {
      print('no hay datos');
    }

    return [
      const FaqsModel(
          id: '1',
          question: '¿Qué es Soy Warmi y cuál es su misión?',
          answer:
              'Soy Warmi es una organización sin fines de lucro que promueve la educación sexual integral a través de redes sociales, talleres y colaboraciones, liderada por Valentina Wiñay Quispe y un grupo comprometido de jóvenes.'),
      const FaqsModel(
          id: '2',
          question: '¿Cómo puedo participar en los talleres de Soy Warmi?',
          answer:
              '- Mantente atento a nuestras redes sociales para conocer las fechas de talleres presenciales y en vivo. También puedes contactarnos para colaboraciones y eventos.'),
      const FaqsModel(
          id: '3',
          question: '¿Cuál es el respaldo de Soy Warmi?',
          answer:
              'Contamos con el respaldo del programa Youth Ambassadors de la Embajada de Estados Unidos, World Learning y The Pollination Project, lo que impulsa nuestra labor en pro de la educación sexual integral.'),
      const FaqsModel(
          id: '4',
          question:
              '¿Cuántas personas ha alcanzado Soy Warmi con sus talleres presenciales?',
          answer:
              'Hasta ahora, hemos llegado a más de 500 personas en 6 departamentos de Bolivia a través de nuestros talleres presenciales.'),
    ];
  }
}
