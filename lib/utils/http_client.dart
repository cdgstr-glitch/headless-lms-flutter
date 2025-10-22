import 'package:http/http.dart' as http;

typedef HttpClientFactory = http.Client Function();

http.Client defaultHttpClientFactory() => http.Client();
