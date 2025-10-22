import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/app_environment.dart';
import '../constants/api_endpoints.dart';
import '../exceptions/api_exception.dart';
import '../../utils/http_client.dart';

class LearnPressApiService {
  LearnPressApiService({
    required this.environment,
    http.Client? httpClient,
    HttpClientFactory httpClientFactory = defaultHttpClientFactory,
  }) : _httpClient = httpClient ?? httpClientFactory();

  final AppEnvironment environment;
  final http.Client _httpClient;

  Map<String, String> get _defaultHeaders => const {
        'Accept': 'application/json',
      };

  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? queryParameters,
  }) async {
    final uri = environment.resolveEndpoint(
      endpoint,
      queryParameters: queryParameters,
    );

    final response = await _httpClient.get(uri, headers: _defaultHeaders);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return null;
      }

      return jsonDecode(response.body);
    }

    throw ApiException(
      "Request to '${uri.toString()}' failed with status code ${response.statusCode}",
      statusCode: response.statusCode,
    );
  }

  Future<List<dynamic>> fetchCoursesJson({
    int page = 1,
    int perPage = 10,
  }) async {
    final response = await get(
      ApiEndpoints.courses,
      queryParameters: <String, String>{
        'page': '$page',
        'per_page': '$perPage',
      },
    );

    if (response is List<dynamic>) {
      return response;
    }

    throw ApiException('Unexpected response structure when loading courses');
  }

  void dispose() {
    _httpClient.close();
  }
}
