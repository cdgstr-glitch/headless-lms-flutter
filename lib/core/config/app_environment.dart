class AppEnvironment {
  const AppEnvironment({
    this.baseUrl = const String.fromEnvironment(
      'LEARNPRESS_BASE_URL',
      defaultValue: 'https://example.com',
    ),
    this.apiPath = const String.fromEnvironment(
      'LEARNPRESS_API_PATH',
      defaultValue: '/wp-json/learnpress/v1/',
    ),
  });

  final String baseUrl;
  final String apiPath;

  Uri resolveEndpoint(
    String endpoint, {
    Map<String, String>? queryParameters,
  }) {
    final root = Uri.parse(baseUrl);
    final apiRoot = root.resolve(apiPath);
    final target = apiRoot.resolve(endpoint);
    return target.replace(queryParameters: queryParameters);
  }
}
