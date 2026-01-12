import 'package:smart_assistant_app/model/course/current_course.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/model/syllabus_model.dart';
import 'package:smart_assistant_app/model/user_model.dart';

class UserRequestCourseModel{
  final UserModel userModel;
  final List<CourseModel> courseRequest;
  final List<CurrentCourse>? currentCourse;
  final CourseWithSyllabiModel? courseWithSyllabiModel;
  UserRequestCourseModel({required this.userModel, required this.courseRequest , this.currentCourse , this.courseWithSyllabiModel});
}