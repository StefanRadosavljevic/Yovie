import 'package:get_it/get_it.dart';
import 'package:movieapp/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  HTTPService? _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }
}
