import '../../model/course/completed_course.dart';
import '../../model/course_model.dart';

class FunctionForCourses {
  static List<CourseModel> getCourses(List<CourseModel> allCourses, List<CompletedCourses> completedCourse) {
    // إنشاء مجموعة من معرفات الدورات المكتملة
    final completedIds = completedCourse.map((c) => c.id).toSet();
    // تصفية القائمة وإرجاع الدورات التي تتطابق مع المعرفات المكتملة
    return allCourses.where((course) => completedIds.contains(course.id)).toList();
  }
}
