import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_state.dart';

import '../../widget/customize_courses_of_semester/sliver_app_bar_customize_courses_of_semester.dart';

class SliverAppbarCustomizeCoursesOfSemesterBlocBuilder extends StatelessWidget {
  final UserModel userModel;
  const SliverAppbarCustomizeCoursesOfSemesterBlocBuilder({super.key , required this.userModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomizeCoursesCubit, CustomizeCoursesState>(builder: (context , state){
      if(state.status == CustomizeCoursesStatus.succesGetCourese){
           final List<CourseModel> selectedCourses = CourseModel.filterCourses(state.coursesRequest!, (course) => course.isSelected);
           final allUnit = CourseModel.getAllUnit(selectedCourses);
           return SliverAppBarCustomizeCoursesOfSemester(selectedCourses: selectedCourses, allUnit: allUnit, selectedUnits: state.selectedUnits.toDouble(),userModel: userModel,);
      }
      return   SliverAppBarCustomizeCoursesOfSemester(userModel: userModel,);
    }
    );
  }
}