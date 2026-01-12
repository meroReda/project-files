import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_cubit.dart';

import '../loading_bloc/customiz_courses_auto_of_semester/bloc_builder_list_view_customiz_courese_auto.dart';
import '../loading_bloc/customiz_courses_auto_of_semester/bloc_builder_recommendations_container.dart';
import '../widget/customiz_courses_auto_of_semester/app_bar_customiz_courses_auto_of_semester.dart';

class CustomizCoursesAutoOfSemesterScreen extends StatelessWidget {
  final UserModel userModel;
  final List<CourseModel> courseRequest;
  const CustomizCoursesAutoOfSemesterScreen({super.key , required this.userModel , required this.courseRequest});

  @override
  Widget build(BuildContext context) {
    context.read<CustomizeCoursesCubit>().fetch(courseRequest , userModel.userID);
    return  SafeArea(child: Scaffold(
      appBar:   AppBarCustomizCoursesAutoOfSemester(userModel: userModel,),
      body: Padding(
        padding: PaddingApp.getHorVer(15,10),
        child:  Column(
          children: [
            getHeight(20),
             const BlocBuilderRecommendationsContainer(),
             getHeight(20),
             const Expanded(child: BlocBuilderListViewCustomizCoureseAuto()),
          ],
        ),
      ),
    ));
  }
}
