import 'dart:convert';

class CurrentCourse {
  final String id;
  final String name;
  final String? doctorName;
  final String sessionName;
  final String unit;
  final List<String> requests;
  final String code;
  final String enrollmentId;
  final String academicYear;
  final String semester;
  final String enrollmentDate;
  final String statusCourse;

  CurrentCourse({
    required this.id,
    required this.name,
    this.doctorName,
    required this.sessionName,
    required this.unit,
    required this.requests,
    required this.code,
    required this.enrollmentId,
    required this.academicYear,
    required this.semester,
    required this.enrollmentDate,
    required this.statusCourse,
  });

  // دالة لتحويل JSON إلى CurrentCourse
  factory CurrentCourse.fromJson(Map<String, dynamic> json) {
    List<String> requestsList = [];

    // معالجة حقل requests
    if (json['requests'] != null) {
      if (json['requests'] is String && (json['requests'] as String).isNotEmpty) {
        try {
          final decoded = jsonDecode(json['requests']);
          if (decoded is List) {
            requestsList = List<String>.from(decoded);
          }
        } catch (e) {
          // في حالة فشل التحويل
          requestsList = [];
        }
      } else if (json['requests'] is List) {
        requestsList = List<String>.from(json['requests']);
      }
    }

    return CurrentCourse(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      doctorName: json['doctor_name']?.toString(),
      sessionName: json['session_name']?.toString() ?? '',
      unit: json['unit']?.toString() ?? '0',
      requests: requestsList,
      code: json['code']?.toString() ?? '',
      enrollmentId: json['enrollment_id']?.toString() ?? '',
      academicYear: json['academic_year']?.toString() ?? '',
      semester: json['semester']?.toString() ?? '',
      enrollmentDate: json['enrollment_date']?.toString() ?? '',
      statusCourse: json['status_course']?.toString() ?? '',
    );
  }

  // تحويل CurrentCourse إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'doctor_name': doctorName,
      'session_name': sessionName,
      'unit': unit,
      'requests': requests,
      'code': code,
      'enrollment_id': enrollmentId,
      'academic_year': academicYear,
      'semester': semester,
      'enrollment_date': enrollmentDate,
      'status_course': statusCourse,
    };
  }

  // دالة لتحويل قائمة من JSON إلى قائمة من CurrentCourse
  static List<CurrentCourse> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CurrentCourse.fromJson(json)).toList();
  }

  static int getAllUnit(List<CurrentCourse> list) {
    int sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += int.parse(list[i].unit);
    }
    return sum;
  }




}