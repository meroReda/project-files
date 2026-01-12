import 'package:smart_assistant_app/model/course_model.dart';

class OptionModel {
  final String optionName;
  final String description;
  final List<CourseModel> courses;
  final int totalUnits;
  final int courseCount;
  final double averageDifficulty;

  OptionModel({
    required this.optionName,
    required this.description,
    required this.courses,
    required this.totalUnits,
    required this.courseCount,
    required this.averageDifficulty,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {

    return OptionModel(
      optionName: json['option_name'] ?? '',
      description: json['description'] ?? '',
      courses: (json['courses'] as List<dynamic>?)?.map((course) => CourseModel.fromJson(course)).toList() ??[],
      totalUnits: json['total_units'] ?? 0,
      courseCount: json['course_count'] ?? 0,
      averageDifficulty: (json['average_difficulty'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // إضافة دالة fromJsonList
  static List<OptionModel> fromJsonList(List<dynamic> jsonList) {
    List<OptionModel> options = [];
    for (var json in jsonList) {
    
        if (json != null && json is Map<String, dynamic>) {
          options.add(OptionModel.fromJson(json));
        } else {
          
        }
    }
    return options;
  }
 
}
/*

{option_name: خيار 17 وحدة بديل, 
description: يحتوي على 17 وحدة من مواد بديلة غير مستخدمة في الخيارات الأخرى,
 courses: [
 {id: 32, name: الرياضيات العامة 2, code: MA102, unit: 4},
 {id: 33, name: برمجة الحاسوب, code: CS113, unit: 4},
 {id: 30, name: اللغة العربية 2, code: AR052, unit: 2},
{id: 31, name: اللغة الإنجليزية 2, code: EL102, unit: 2}
   
   ], total_units: 12, course_count: 4, average_difficulty: 2.5}

*/