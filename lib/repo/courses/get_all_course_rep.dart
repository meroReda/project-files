import 'package:smart_assistant_app/model/course_model.dart';
import '../../core/server/end_point.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class GetAllCourseRep {
  static Future<Either<String, List<CourseModel>>> callAPI() async {
    try {
      final response = await http.get(
        Uri.parse(EndPoint.apigetAllCourses),);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(utf8.decode(response.bodyBytes));
        if (responseData['status'] == 'success') {
          if (responseData['data'] is List) {
            List<CourseModel> courses = CourseModel.fromJsonList(responseData['data']);
          
            return Right(courses);
          } else {
            return const  Left('بيانات غير صالحة: البيانات ليست قائمة');
          }
        } else {
          String errorMessage = responseData['message'] ?? 'فشل في جلب البيانات من السيرفر';
          return Left(errorMessage);
        }
      } else if (response.statusCode == 404) {
        return const Left('الرابط غير موجود');
      } else if (response.statusCode == 500) {
        return const Left('خطأ في السيرفر');
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