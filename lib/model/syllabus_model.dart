
class CourseWithSyllabiModel {
  final int courseId;
  final String courseName;
  final String courseCode;
  final List<SyllabusModel> syllabi;

  CourseWithSyllabiModel({
    required this.courseId,
    required this.courseName,
    required this.courseCode,
    required this.syllabi,
  });

 factory CourseWithSyllabiModel.fromJson(Map<String, dynamic> json) {
  try {
    // تحويل course_id من String إلى int
    final courseId = int.tryParse(json['course_id'].toString()) ?? 0;
    return CourseWithSyllabiModel(
      courseId: courseId,
      courseName: json['course_name']?.toString() ?? '',
      courseCode: json['course_code']?.toString() ?? '',
      syllabi: json['syllabi'] is List
          ? List<Map<String, dynamic>>.from(json['syllabi'])
              .map((syllabusJson) {
                // إضافة course_id و user_id إذا لم تكونا موجودين
                syllabusJson['course_id'] = courseId;
                // إذا كان user_id غير موجود في syllabusJson، نتركه كما هو
                return SyllabusModel.fromJson(syllabusJson);
              })
              .toList()
          : [],
    );
  } catch (e) {
    return CourseWithSyllabiModel(
      courseId: 0,
      courseName: 'خطأ في تحميل المادة',
      courseCode: 'خطأ',
      syllabi: [],
    );
  }
}

  static List<CourseWithSyllabiModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => CourseWithSyllabiModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'course_name': courseName,
      'course_code': courseCode,
      'syllabi': syllabi.map((s) => s.toJson()).toList(),
    };
  }

  // تحقق إذا كانت المادة تحتوي على مناهج
  bool get hasSyllabi => syllabi.isNotEmpty;

  // عدد المناهج
  int get syllabiCount => syllabi.length;

  // عدد المناهج الخاصة بالمستخدم
  int getUserSyllabiCount(int userId) {
    return syllabi.where((s) => s.userId == userId).length;
  }

  // المناهج العامة فقط
  List<SyllabusModel> get publicSyllabi {
    return syllabi.where((s) => s.isPublic).toList();
  }

  // المناهج الخاصة فقط
  List<SyllabusModel> get privateSyllabi {
    return syllabi.where((s) => !s.isPublic).toList();
  }

  // الحصول على المناهج الخاصة بمستخدم محدد
  List<SyllabusModel> getSyllabiByUser(int userId) {
    return syllabi.where((s) => s.userId == userId).toList();
  }
}

class SyllabusModel {
  final int syllabusId;
  final int userId;
  final int courseId;
  final String academicYear;
  final String semester;
  final String syllabusName;
  final String filePath;
  final String fileName;
  final int fileSize;
  final String fileType;
  final String? description;
  final bool isPublic;
  final int downloadCount;
  final DateTime uploadedAt;
  final DateTime? updatedAt;

  SyllabusModel({
    required this.syllabusId,
    required this.userId,
    required this.courseId,
    required this.academicYear,
    required this.semester,
    required this.syllabusName,
    required this.filePath,
    required this.fileName,
    required this.fileSize,
    required this.fileType,
    this.description,
    required this.isPublic,
    required this.downloadCount,
    required this.uploadedAt,
    this.updatedAt,
  });

factory SyllabusModel.fromJson(Map<String, dynamic> json) {
  int safeInt(dynamic value, {int fallback = 0}) {
    if (value == null) return fallback;
    if (value is int) return value;
    if (value is String) {
      final parsed = int.tryParse(value);
      return parsed ?? fallback;
    }
    if (value is double) return value.toInt();
    if (value is bool) return value ? 1 : 0;
    return fallback;
  }
  
  String safeString(dynamic value, {String fallback = ''}) {
    if (value == null) return fallback;
    if (value is String) return value.trim();
    return value.toString().trim();
  }
  
  bool safeBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      final str = value.trim().toLowerCase();
      return str == '1' || str == 'true' || str == 'yes' || str == 'نعم';
    }
    return false;
  }
  
  DateTime? safeDateTime(dynamic value) {
    if (value == null) return null;
     
      if (value is DateTime) return value;
      if (value is String && value.trim().isNotEmpty) {
        return DateTime.parse(value.trim());
      }
      if (value is int) {
        return DateTime.fromMillisecondsSinceEpoch(value);
      }
    
    return null;
  }
  
  return SyllabusModel(
    syllabusId: safeInt(json['syllabus_id']),
    userId: safeInt(json['user_id']),
    courseId: safeInt(json['course_id']),
    academicYear: safeString(json['academic_year'], fallback: '2026'),
    semester: safeString(json['semester'], fallback: 'الأول'),
    syllabusName: safeString(json['syllabus_name'], fallback: 'منهج غير معروف'),
    filePath: safeString(json['file_path']),
    fileName: safeString(json['file_name']),
    fileSize: safeInt(json['file_size']),
    fileType: safeString(json['file_type'], fallback: 'application/pdf'),
    description: safeString(json['description']),
    isPublic: safeBool(json['is_public']),
    downloadCount: safeInt(json['download_count']),
    uploadedAt: safeDateTime(json['uploaded_at']) ?? DateTime.now(),
    updatedAt: safeDateTime(json['updated_at']),
  );
}

  Map<String, dynamic> toJson() {
    return {
      'syllabus_id': syllabusId,
      'user_id': userId,
      'course_id': courseId,
      'academic_year': academicYear,
      'semester': semester,
      'syllabus_name': syllabusName,
      'file_path': filePath,
      'file_name': fileName,
      'file_size': fileSize,
      'file_type': fileType,
      'description': description,
      'is_public': isPublic ? 1 : 0,
      'download_count': downloadCount,
      'uploaded_at': uploadedAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}