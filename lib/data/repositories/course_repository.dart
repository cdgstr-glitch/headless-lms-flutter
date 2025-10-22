import '../../core/constants/api_endpoints.dart';
import '../../core/exceptions/api_exception.dart';
import '../../core/services/learnpress_api_service.dart';
import '../models/course.dart';

class CourseRepository {
  CourseRepository({required this.apiService});

  final LearnPressApiService apiService;

  Future<List<Course>> fetchCourses({int page = 1, int perPage = 10}) async {
    final jsonList = await apiService.fetchCoursesJson(
      page: page,
      perPage: perPage,
    );

    return jsonList
        .whereType<Map<String, dynamic>>()
        .map(Course.fromJson)
        .toList();
  }

  Future<Course> fetchCourse(int courseId) async {
    final response = await apiService.get(ApiEndpoints.course(courseId));

    if (response is Map<String, dynamic>) {
      return Course.fromJson(response);
    }

    throw ApiException('Unexpected response while loading course $courseId');
  }
}
