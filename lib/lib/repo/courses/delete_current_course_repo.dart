import '../../core/server/end_point.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


class DeleteCurrentCourseRepo {

  static Future<Either<String, String>> callAPI(String request) async {

     try {
    final response = await http.post(
      Uri.parse(EndPoint.apiDeleteCurrentCoursesForUser), 
      body: request
    );
    
    if (response.statusCode == 200) {
      //  Left(خطأ في الاتصال: 404)
      final Map<String, dynamic> responseData =
          jsonDecode(utf8.decode(response.bodyBytes));
      final String status = responseData['status'];
      final String message = responseData['message'];
      if (status == 'success') {
        return Right(message);
      } else {
        // إذا كانت status ليست 'success'
        return Left(message);
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