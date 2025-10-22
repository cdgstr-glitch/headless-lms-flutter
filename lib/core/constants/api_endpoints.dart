class ApiEndpoints {
  const ApiEndpoints._();

  static const String courses = 'courses';
  static String course(int courseId) => 'courses/$courseId';
  static String courseCurriculum(int courseId) => 'courses/$courseId/curriculum';
}
