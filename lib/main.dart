import 'package:flutter/material.dart';

import 'app.dart';
import 'core/config/app_environment.dart';
import 'core/services/learnpress_api_service.dart';
import 'data/repositories/course_repository.dart';

void main() {
  const environment = AppEnvironment();
  final apiService = LearnPressApiService(environment: environment);
  final courseRepository = CourseRepository(apiService: apiService);

  runApp(
    HeadlessLmsApp(
      environment: environment,
      courseRepository: courseRepository,
    ),
  );
}
