import 'package:http/http.dart' as http;
import 'package:smart_assistant_app/model/course/completed_course.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/model/course/courses_user.dart';
import 'package:smart_assistant_app/model/course/current_course.dart';
import '../../core/server/end_point.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';

class GetAllCoursesForUserRepo {
  static Future<Either<String, CoursesUser>> callAPI(
      String request) async {
    final response = await http.post(Uri.parse(EndPoint.apiGetAllCouresesForUser), body: request);
    final Map<String, dynamic> responseData = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      final responseCourses         = responseData['completed_courses'];
      final responseCurrentCourses  = responseData['current_courses'];
      final summary                 = responseData['summary'];
      final List<CompletedCourses> courses         =  responseCourses .map<CompletedCourses>( (courseJson) => CompletedCourses.fromJson(courseJson)).toList();
      final List<CurrentCourse> currentCourse      =  responseCurrentCourses.map<CurrentCourse> ((courseJson) => CurrentCourse.fromJson(courseJson)).toList();
      final List<CourseModel> allCourses           =  CourseModel.fromJsonList(responseData['courses']);
      final List<CourseModel> availableCourses     =  CourseModel.fromJsonList(responseData['available_courses']);
      final List<CourseModel> otherCourses         =  [];
      final int totalNumberOfCompletedUnits        =  summary['total_completed_units'];
      final int totalNumberOfCurrentUnits          =  summary['total_current_units'];
      final int totalAllCoursesUnits               =  summary['total_all_courses_units'];
      final int totalNumberOfAvailableUnits        =  summary['total_available_units'];
      final int totalNumberOfCurrentCompletedUnits =  summary['total_current_completed_units']; 
      final int totalCompletedCourses              =  summary['total_completed_courses'];
      final int totalCurrentCourses                =  summary['total_current_courses'];
      final int totalAvailableCourses              =  summary['total_current_completed_units'];
      
     
      return Right(
       CoursesUser(
        totalNumberOfAvailableUnits: totalNumberOfAvailableUnits,
        totalNumberOfCurrentCompletedUnits: totalNumberOfCurrentCompletedUnits,
        totalAvailableCourses: totalAvailableCourses,
        completedCourse: courses ,
        currentCourse: currentCourse ,
        allCourses: allCourses,
        otherCourses: otherCourses,
        totalNumberOfCurrentUnits: totalNumberOfCurrentUnits,
        courseRequest: availableCourses,
        totalCurrentCourses: totalCurrentCourses,
        totalNumberOfCompletedUnits: totalNumberOfCompletedUnits,
        totalNumbrtOfAllCoursesUnits: totalAllCoursesUnits,
        totalCompletedCourses: totalCompletedCourses));
    }
    return const Left('لا يوجد إتصال بالإنترنت');
  }
}


