import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyUser = 'user_data';
  static const _keyOnboarding = 'user_onboarding';
  static const _completedCourses = 'completed_courses';
  static const _customizeCoursesOfSemester = 'customize_courses_of_semester';



  // حفظ بيانات مستخدم
  static Future<void> saveUser(String userJson) async {
    await _storage.write(key: _keyUser, value: userJson);
  }
  
  // حفظ  تخطي شاشة تأهيل
  static Future<void> saveOnboarding(String value) async {
    await _storage.write(key: _keyOnboarding, value: value);
  }
  
  static Future<void> completedCourses(String value) async {
    await _storage.write(key: _completedCourses, value: value);
  }

  static Future<String?> getCompletedCourses() async {
    return await _storage.read(key: _completedCourses);
  }
  
  static Future<void> customizeCoursesOfSemester(String value) async {
    await _storage.write(key: _customizeCoursesOfSemester, value: value);
  }

  static Future<String?> getcustomizeCoursesOfSemester() async {
    return  _storage.read(key: _customizeCoursesOfSemester);
  }

   


  
  //جلب بيانات شاشة تأهيل
  static Future<String?> getOnboarding() async {
    return await _storage.read(key: _keyOnboarding);
  }

  // جلب بيانات المستخدم (اختياري)
  static Future<String?> getUser() async {
    return await _storage.read(key: _keyUser);
  }

  //----------------Clear-----------------------//
  // مسح كل البيانات (لتسجيل الخروج)

  static Future<void> clearCustomizeCoursesOfSemester() async {
    await _storage.delete(key : _customizeCoursesOfSemester);
  }

  static Future<void> clearCompletedCourses() async {
    await _storage.delete(key : _completedCourses);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
  static Future<void> clearUser() async {
    await _storage.delete(key: _keyUser);
  }

  static Future<void> clearOnBoarding() async {
    await _storage.delete(key: _keyOnboarding);
  }

}
