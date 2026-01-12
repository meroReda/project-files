import 'dart:convert';

class CompletedCourses {
  final String id;
  final String name;
  final String doctorName;
  final String sessionName;
  final String unit;
  final List<String> requests;
  final String code;
  final String completionId;
  final double? grade;
  final String academicYear;

  CompletedCourses({
    required this.id,
    required this.name,
    required this.doctorName,
    required this.sessionName,
    required this.unit,
    required this.requests,
    required this.code,
    required this.completionId,
    this.grade,
    required this.academicYear,
  });
  
  factory CompletedCourses.fromJson(Map<String, dynamic> json) {
    return CompletedCourses(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      doctorName: json['doctor_name']?.toString() ?? '',
      sessionName: json['session_name']?.toString() ?? '',
      unit: json['unit']?.toString() ?? '',
      requests: _parseRequests(json['requests']),
      code: json['code']?.toString() ?? '',
      completionId: json['completion_id']?.toString() ?? '',
      grade: json['grade'],
      academicYear: json['academic_year']?.toString() ?? '',
    );
  }

  static List<String> _parseRequests(dynamic requestsData) {
    if (requestsData == null) return ['لا يوجد'];
    
    if (requestsData is String) {
      try {
        // تحويل JSON string إلى List
        final parsed = json.decode(requestsData) as List<dynamic>;
        return parsed.map((item) => item.toString()).toList();
      } catch (e) {
        // إذا فشل التحويل، نعيد القيمة كقائمة تحتوي على النص
        return [requestsData];
      }
    } else if (requestsData is List) {
      return requestsData.map((item) => item.toString()).toList();
    }
    return ['لا يوجد'];
  }


  @override
  String toString() {
    return 'CompletedCourse(id: $id, name: $name, doctorName: $doctorName, grade: $grade)';
  }
  CompletedCourses copyWith({
    String? id,
    String? name,
    String? doctorName,
    String? sessionName,
    String? unit,
    List<String>? requests,
    String? code,
    String? completionId,
    double? grade,
    String? academicYear,
  }) {
    return CompletedCourses(
      id: id ?? this.id,
      name: name ?? this.name,
      doctorName: doctorName ?? this.doctorName,
      sessionName: sessionName ?? this.sessionName,
      unit: unit ?? this.unit,
      requests: requests ?? this.requests,
      code: code ?? this.code,
      completionId: completionId ?? this.completionId,
      grade: grade ?? this.grade,
      academicYear: academicYear ?? this.academicYear,
    );
  }

   static int getAllUnit(List<CompletedCourses> list) {
    int sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += int.parse(list[i].unit);
    }
    return sum;
  }
}