import 'dart:convert';
class CourseModel {
  final String? id;
  final String name;
  final String code;
  final String? doctorName;
  final String sessonName;
  final String unit;
  final List<String> request;
  final String level;
  final String isOpen;
  final String optional;
  bool isSelected;
  CourseModel(
      {this.id,
      this.isSelected = false,
      required this.optional,
      required this.isOpen,
      required this.level,
      required this.name,
      required this.code,
      required this.doctorName,
      required this.sessonName,
      required this.unit,
      required this.request});

  static List<CourseModel> filterCoursesBySession(List<CourseModel> courses, String sessionName) {
    if(sessionName == 'أختيارية'){
      return courses.where((courses) => courses.optional == '1').toList();
    }
    return courses.where((course) => course.sessonName == sessionName && course.optional != '1').toList();
  }


  static List<CourseModel> getAvailableCoursesForRegistration({ required List<CourseModel> completedCourses, // المواد المكتملة ✓
   required List<CourseModel> allAvailableCourses, // جميع المواد المتاحة
  }) {
    // 1. استخراج أكواد المواد المكتملة
    final completedCodes = completedCourses
        .map((course) => course.code)
        .where((code) => code.isNotEmpty)
        .toSet();

    // 2. فلترة المواد المتاحة بناءً على المتطلبات
    return allAvailableCourses.where((availableCourse) {
      // إذا كانت المادة ليس لها متطلبات، فهي متاحة مباشرة
      if (availableCourse.request.isEmpty) {
        return true;
      }

      // التحقق من أن جميع متطلبات المادة مكتملة
      final allRequirementsMet = availableCourse.request.every(
        (requirement) => completedCodes.contains(requirement),
      );

      return allRequirementsMet;
    }).toList();
  }

  // دالة ترجع المواد التي لم يتم اختيارها
  static List<CourseModel> getUnselectedCourses(
      List<CourseModel> allCourses, List<CourseModel> selectedCourses) {
    final selectedCodes = selectedCourses.map((course) => course.code).toSet();
    return allCourses
        .where((course) => !selectedCodes.contains(course.code))
        .toList();
  }

  static int countFilterCoursesBySession(List<CourseModel> courses, String sessionName) {
    return courses.where((course) => course.sessonName == sessionName).toList().length;
  }


  factory CourseModel.fromJson(Map<String, dynamic> json) {
    List<String> requestsList = [];
    
    if (json['requests'] != null) {
      try {
        // إذا كانت requests مخزنة كـ JSON string
        if (json['requests'] is String) {
          if ((json['requests'] as String).trim().isNotEmpty) {
            final requestsJson = jsonDecode(json['requests']);
            if (requestsJson is List && requestsJson.isNotEmpty) {
              requestsList = List<String>.from(requestsJson);
            }
          }
        } else if (json['requests'] is List && json['requests'].isNotEmpty) {
          requestsList = List<String>.from(json['requests']);
        }
      } catch (e) {
        requestsList = []; // بدلاً من ['لا يوجد']
      }
    }
    return CourseModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      doctorName: json['doctor_name']?.toString() ?? '',
      sessonName: json['session_name']?.toString() ?? '',
      unit: json['unit']?.toString() ?? '',
      isOpen: json['isOpen']?.toString() ?? '0', // قيمة افتراضية
      optional: json['optional']?.toString() ?? '0', // قيمة افتراضية
      level: json['level']?.toString() ?? '0', // قيمة افتراضية
      request: requestsList,
    );
  }

  // دالة لتحويل List من JSON إلى List من CourseModel
  static List<CourseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CourseModel.fromJson(json)).toList();
  }

  static int getAllUnit(List<CourseModel> list) {
    int sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += int.parse(list[i].unit);
    }
    return sum;
  }
  
  static List<CourseModel> filterCourses(List<CourseModel> originalList, bool Function(CourseModel) condition) {
    return originalList.where(condition).toList();
  }
}
