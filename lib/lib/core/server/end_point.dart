class EndPoint {
  static const String baseUrl = 'http://api-app.justhost.ly/smart_assistant_apis/';
  static const String apiLogin = '${baseUrl}LogIn.php'; // ! OK
  static const String apiSignup = '${baseUrl}SignUp.php'; // ! OK
  static const String apiUpdateSecurityQuestion     = '${baseUrl}update_security_question.php';
  static const String apigetAllCourses        = '${baseUrl}get_all_courses.php'; // ! OK 
  static const String apiInsertCoursesForUser = '${baseUrl}insert_courses_for_user.php'; // ! OK 
  static const String apiGetAllCouresesForUser = '${baseUrl}get_all_courses_for_student.php'; // ! OK
  static const String apiInsertCurrentCoursesForUser = '${baseUrl}insert_courses_current_for_user.php';
  static const String apiDeleteCurrentCoursesForUser = '${baseUrl}delete_course_current_for_user.php';  
  static const String apigetUser                      = '$baseUrl}get_user.php';  
  static const String apiUpdateUser                   = '${baseUrl}update_data_profile_user.php';
  static const String apigetScheduleOptions           = '${baseUrl}get_course_options.php';
  static const String apiGetSyllabus                   = '${baseUrl}get_syllabus_for_user.php';
  static const String apiUploadSyllabus                   = '${baseUrl}add_syllabus.php';
  static const String addCourseRating                     = '${baseUrl}add_rating_for_user.php';
  
  static const String getCourseRatings                     = '${baseUrl}get_all_rating_for_student.php';
// getCourseRatings
  // apiUploadSyllabus
}