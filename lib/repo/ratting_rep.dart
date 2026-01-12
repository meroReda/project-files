// lib/features/ratings/data/repository/ratings_repository.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_assistant_app/core/server/end_point.dart';

class RatingsRepository {
  static Future<Map<String, dynamic>> getCourseRatings({
    required int userId,
    required List<int> courseIds,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(EndPoint.getCourseRatings), // يجب تعريف هذا الـ EndPoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_id': userId,
          'course_ids': courseIds,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return data;
      } else {
        throw Exception('Failed to load ratings: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}