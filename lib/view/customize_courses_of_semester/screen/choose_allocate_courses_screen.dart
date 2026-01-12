import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/widget_app/check_owns_courses/column_own%20_course.dart';
import 'package:smart_assistant_app/model/course/current_course.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/loading_bloc/choose_allocate_courses/button_choos_allocate_courses_bloc_builder.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/loading_bloc/choose_allocate_courses/container_choose_allocate_course_bloc_builder.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/widget/choose_allocate_courses/app_bar_choose_allocate_course.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/widget/choose_allocate_courses/upper_bar_choose_allocate_courses.dart';
import 'package:smart_assistant_app/view_model/home/home_cubit.dart';
import 'package:smart_assistant_app/view_model/home/home_state.dart';
import '../../../model/course_model.dart';
import '../widget/choose_allocate_courses/simple_requirement_card.dart';

class ChooseAllocateCourses extends StatelessWidget {
  final UserModel userModel;
  final List<CourseModel> courseRequest;
  final List<CurrentCourse>? currentCourse;
  const ChooseAllocateCourses({super.key, required this.userModel, required this.courseRequest, this.currentCourse});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarChooseAllocateCourse(),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state.coursesUser!.currentCourse.isEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const UpperBarChooseAllocateCourses(),
                  getHeight(20),
                  const ContainerChooseAllocateCourseBlocBuilder(),
                  const SimpleRequirementCard(),
                  getHeight(40),
                  ButtonChoosAllocateCoursesBlocBuilder(
                    userModel: userModel,
                    courseRequest: courseRequest,
                  ),
                ],
              ),
            );
          }
          return ColumnOwn(
            userModel: userModel,
            currentCourse: state.coursesUser!.currentCourse,
            courseRequest: courseRequest,
          );
        }),
      ),
    );
  }
}
