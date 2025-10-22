import 'package:flutter/material.dart';

import '../../data/models/course.dart';

class CourseListTile extends StatelessWidget {
  const CourseListTile({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _CourseThumbnail(thumbnailUrl: course.thumbnailUrl),
      title: Text(course.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            course.status,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (course.price != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('ราคา: ${course.price}'),
            ),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('เลือกคอร์ส: ${course.title}'),
          ),
        );
      },
    );
  }
}

class _CourseThumbnail extends StatelessWidget {
  const _CourseThumbnail({this.thumbnailUrl});

  final String? thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = thumbnailUrl;
    if (resolvedUrl == null || resolvedUrl.isEmpty) {
      return const CircleAvatar(
        child: Icon(Icons.school_outlined),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        resolvedUrl,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return const CircleAvatar(
            child: Icon(Icons.school_outlined),
          );
        },
      ),
    );
  }
}
