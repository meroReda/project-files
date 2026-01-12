import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:smart_assistant_app/core/server/local_storage.dart';
import '../core/server/end_point.dart';
import '../model/user_model.dart';

class LoginRepo {
  static Future<Either<String, UserModel>> callAPI(String loginRequest) async {
    try {
      final response =
          await http.post(Uri.parse(EndPoint.apiLogin), body: loginRequest);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        UserModel userModel =UserModel.fromJson(jsonDecode(response.body)['user']);
        await LocalStorage.saveUser(jsonEncode(jsonResponse['user']));
        return Right(userModel);
      } else {
        return const Left("بريد أو كلمة المرور غير صحيحة");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}

class SignUpRepo {
  static Future<Either<String, UserModel>> callAPI(String signupRequest) async {
    try {
      final response = await http.post(Uri.parse(EndPoint.apiSignup), body: signupRequest);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        UserModel userModel =UserModel.fromJson(jsonDecode(response.body)['user']);
        await LocalStorage.saveUser(jsonEncode(jsonResponse['user']));
        return Right(userModel);
      } else {
        return const Left("البريد الإلكتروني مستخدم مسبقاً.");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, String>> insertQuestion(String request) async {
    try {
      final response = await http.post(Uri.parse(EndPoint.apiUpdateSecurityQuestion), body: request);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == 'success') {
          return const Right("تم تحديث سؤال الأمان وإجابته بنجاح");
        }
        return const Right('لم يتم إضافة إجابة');
      }
      return const Right('لا يوجد إتصال');
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, UserModel>> getUser(String request) async {
    try {
      final response = await http.post(
        Uri.parse(EndPoint.apigetUser),
        body: request,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          final user = UserModel.fromJson(data['data']);
          return Right(user);
        } else {
          return Left(data['message'] ?? 'فشل في جلب بيانات المستخدم');
        }
      } else if (response.statusCode == 404) {
        return const Left('المستخدم غير موجود');
      } else if (response.statusCode == 401) {
        return const Left('غير مصرح بالوصول');
      } else if (response.statusCode == 400) {
        return const Left('بيانات غير صحيحة');
      } else {
        return Left('خطأ في الخادم: ${response.statusCode}');
      }
    } catch (e) {
      return Left('حدث خطأ في الاتصال: $e');
    }
  }


  static Future<Either<String, UserModel>> updateUser(String request) async {
    try {
      final response = await http.post(
        Uri.parse(EndPoint.apiUpdateUser),
        body: request,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          final user = UserModel.fromJson(data['user']);
          LocalStorage.clearUser();
          await LocalStorage.saveUser(jsonEncode(data['user']));
          return Right(user);
        } else {
          return Left(data['message'] ?? 'فشل في جلب بيانات المستخدم');
        }
      } else if (response.statusCode == 404) {
        return const Left('المستخدم غير موجود');
      } else if (response.statusCode == 401) {
        return const Left('غير مصرح بالوصول');
      } else if (response.statusCode == 400) {
        return  const Left("لم يتم تحديث أي بيانات. قد تكون البيانات نفس القيم الحالية.");
      } else {
        return Left('خطأ في الخادم: ${response.statusCode}');
      }
    } catch (e) {
      return Left('حدث خطأ في الاتصال: $e');
    }
  }

}
