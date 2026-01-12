import 'package:smart_assistant_app/model/course/completed_course.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/model/course/current_course.dart';

class CoursesUser {
  final List<CompletedCourses> completedCourse;
  final List<CurrentCourse> currentCourse;
  final List<CourseModel> allCourses;
  final List<CourseModel> otherCourses;
  final List<CourseModel> courseRequest;
  final int totalNumberOfCompletedUnits; // ! عدد وحدات مواد المنجزة 
  int totalNumberOfCurrentUnits; // ! عدد وحدات فصل الدراسي الحالي
  final int totalNumbrtOfAllCoursesUnits; //  ! عدد وحدات جميع مواد قسم
  final int totalNumberOfAvailableUnits; // ! عدد وحدات التي يمن تنزيلها في فصل الحالي
  final int totalNumberOfCurrentCompletedUnits; // ! عددوحدات مواد منجزة وفصل دراسي الحالي

  
  final int totalCompletedCourses; // ! عدد مواد المنجزة 
  final int totalCurrentCourses; // ! عدد مواد التي تم تنزيلها في فصل دراسي الحالي
  final int totalAvailableCourses; // ! عدد مواد التي يمكن تنزيلها 

  CoursesUser({
    required this.completedCourse,
    required this.totalAvailableCourses,
    required this.currentCourse,
    required this.allCourses,
    required this.totalNumberOfCurrentCompletedUnits,
    required this.totalNumberOfAvailableUnits,
    required this.otherCourses,
    required this.courseRequest,
    required this.totalNumberOfCompletedUnits,
    required this.totalNumberOfCurrentUnits,
    required this.totalNumbrtOfAllCoursesUnits,
    required this.totalCompletedCourses,
    required this.totalCurrentCourses,
  });
  static List<CourseModel> getOtherCourses(List<CurrentCourse> currentCourse,
      List<CompletedCourses> completedCourse , List<CourseModel> allCourses) {
    final completedIds = completedCourse.map((c) => c.id).toSet();
    final currentIds = currentCourse.map((c) => c.id).toSet();
    List<CourseModel> other =  allCourses.where((course) {
      return !completedIds.contains(course.id) && !currentIds.contains(course.id);
    }).toList();
    return other;
  }

  
}
