import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:smart_assistant_app/model/option_model.dart';
import '../../core/server/end_point.dart';

class GetScheduleOptionsRep {
  static Future<Either<String, List<OptionModel>>> callAPI(
      List<String> selectedCourseIds, String userId) async {
    try {
      // إعداد البيانات لإرسالها
      final Map<String, dynamic> requestData = {
        'course_ids': selectedCourseIds,
        'user_id': userId,
      };

      final response = await http.post(
        Uri.parse(EndPoint.apigetScheduleOptions),
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes));

        if (responseData['status'] == 'success') {
          final List<OptionModel> options = OptionModel.fromJsonList(
              responseData['options'] ?? []);
          options.sort((a, b) => b.courseCount.compareTo(a.courseCount));

          return Right(options);
        } else {
          String errorMessage =
              responseData['message'] ?? 'فشل في إنشاء خيارات الجدول';
          return Left(errorMessage);
        }
      } else if (response.statusCode == 404) {
        return const Left('الرابط غير موجود');
      } else if (response.statusCode == 500) {
        return const Left('خطأ في السيرفر');
      } else if (response.statusCode == 400) {
        return const Left('بيانات غير صحيحة، يرجى التحقق من المواد المختارة');
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