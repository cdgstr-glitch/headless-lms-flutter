import 'package:flutter/material.dart';

import 'core/config/app_environment.dart';
import 'data/repositories/course_repository.dart';
import 'presentation/screens/home_screen.dart';

class HeadlessLmsApp extends StatelessWidget {
  const HeadlessLmsApp({
    super.key,
    required this.environment,
    required this.courseRepository,
  });

  final AppEnvironment environment;
  final CourseRepository courseRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Headless LMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomeScreen(
        environment: environment,
        courseRepository: courseRepository,
      ),
    );
  }
}
