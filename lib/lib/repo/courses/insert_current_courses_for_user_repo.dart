import '../../core/server/end_point.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class InsertCurrentCoursesForUserRepo {
  static Future<Either<String, String>> callAPI(String request) async {
    try {
      final response = await http.post(Uri.parse(EndPoint.apiInsertCurrentCoursesForUser), body: request);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes));

        if (responseData['status'] == 'success') {
          return const Right('تم إضافة المواد المختارة');
        } else {
          String errorMessage = responseData['message'] ?? 'فشل في جلب البيانات من السيرفر';
          return Left(errorMessage);
        }
      } else {
        return Left('خطأ في الاتصال: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      return Left('خطأ في الاتصال بالشبكة: ${e.message}');
    } on FormatException catch (e) {
      return Left('خطأ في تنسيق البيانات: ${e.message}');
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }
}