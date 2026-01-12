import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/cubit_app/connect_cubit.dart';
import 'package:smart_assistant_app/core/router/router_model.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view/auth/screen/login_screen.dart';
import 'package:smart_assistant_app/view/auth/screen/signup_screen.dart';
import 'package:smart_assistant_app/view/completed_courses/screen/completed_courses_screen.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/screen/choose_allocate_courses_screen.dart';
import 'package:smart_assistant_app/view/home/screen/home_screen.dart';
import 'package:smart_assistant_app/view/profile/screen/change_password_screen.dart';
import 'package:smart_assistant_app/view/profile/screen/profile_screen.dart';
import 'package:smart_assistant_app/view/recommended_courses/screen/recommended_courses_screen.dart';
import 'package:smart_assistant_app/view/securityQuestion/screen/security_question_screen.dart';
import 'package:smart_assistant_app/view/syllabus/screen/syllabus_course.dart';
import 'package:smart_assistant_app/view/syllabus/screen/syllabus_screen.dart';
import 'package:smart_assistant_app/view_model/auth/bloc_login/login_cubit.dart';
import 'package:smart_assistant_app/view_model/auth/bloc_signup/signup_cubit.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/profile/profile_cubit.dart';
import 'package:smart_assistant_app/view_model/securityQuestion/security_question_cubit.dart';
import '../../view/customize_courses_of_semester/screen/customiz_courses_auto_of_semester.dart';
import '../../view/customize_courses_of_semester/screen/customize_courses_of_semester_screen.dart';
import '../../view/onboarding/screen/onboarding_screen.dart';
import '../../view/splash/splash_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings ) {
    switch (settings.name) {
      case RouterViews.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouterViews.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case RouterViews.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => LoginCubit(ConnectivityCubit()), child: const LoginScreen()));

      case RouterViews.signup:
        return MaterialPageRoute(
            builder: (_) => BlocProvider( create: (context) => SignupCubit(ConnectivityCubit()),child: const SignupScreen()));


      case RouterViews.securityQuestion:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute( builder: (_) => BlocProvider( create: (context) => SecurityQuestionCubit(), child: SecurityQuestionScreen(userModel: userModel, )));
           


      case RouterViews.completedCourses:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute( builder: (_) => BlocProvider( create: (context) => CompletedCoursesCubit(ConnectivityCubit())..beforeRepo(), child: CompletedCoursesScreen(userModel: userModel, )) );
      
      case RouterViews.home:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (_) => HomeScreen (userModel: userModel,));



      case RouterViews.chooseAllocateCourses:
        final model = settings.arguments as UserRequestCourseModel;
        return MaterialPageRoute(builder: (_) =>  BlocProvider(
          create: (context) => CustomizeCoursesCubit(),
          child: ChooseAllocateCourses(userModel: model.userModel, courseRequest: model.courseRequest, currentCourse: model.currentCourse!,)));


      case RouterViews.customizeCoursesOfSemester:
        final model = settings.arguments as UserModel;
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => CustomizeCoursesCubit(),
          child: CustomizeCoursesOfSemesterScreen(userModel: model)));

      case RouterViews.customizCoursesAutoOfSemester:
        final model = settings.arguments as UserRequestCourseModel;
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) =>  CustomizeCoursesCubit(),
          child: CustomizCoursesAutoOfSemesterScreen(userModel: model.userModel, courseRequest: model.courseRequest,)));


      case RouterViews.recommendedCourses:
        final model = settings.arguments as UserRequestCourseModel;
        return MaterialPageRoute(builder: (_) => RecommendedCoursesScreen(userModel: model.userModel , currentCourse: model.currentCourse! , courseRequest: model.courseRequest));


      case RouterViews.syllabusScreen:
        final model = settings.arguments as UserRequestCourseModel;
        return MaterialPageRoute(builder: (_) => SyllabusScreen(userModel: model.userModel, currentCourse: model.currentCourse!, courseRequest: model.courseRequest,));
 
      case RouterViews.syllabusCourse:
        final model = settings.arguments as UserRequestCourseModel;
        return MaterialPageRoute(builder: (_) => SyllabusCourse(userModel: model.userModel, courseWithSyllabiModel: model.courseWithSyllabiModel!,));
 

      case RouterViews.profileScreen:
        final model = settings.arguments as UserModel;
        return MaterialPageRoute( builder: (_) =>  BlocProvider(
          create: (context) => ProfileCubit(),
          child: ProfileScreen(userModel: model)));


      case RouterViews.chagePassword:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => ProfileCubit(),
              child: const ChangePasswordScreen()));




      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('لا يوجد مسار معين هنا: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
