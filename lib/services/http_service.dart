import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:movieapp/models/config.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  String? _baseUrl;
  String? _apiKey;

  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    _baseUrl = _config.BASE_API_URL;
    _apiKey = _config.API_KEY;
  }

  Future<Response> get(String _path, Map<String, dynamic>? query) async {
    try {
      String _url = '$_baseUrl$_path';
      Map<String, dynamic>? _query = {
        'api_key': _apiKey,
        'language': 'en-US',
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(_url, queryParameters: _query);
    } on DioError catch (e) {
      print('Unable to perform get requres.');
      print('DioError: $e');
      throw Error();
    }
  }
}
