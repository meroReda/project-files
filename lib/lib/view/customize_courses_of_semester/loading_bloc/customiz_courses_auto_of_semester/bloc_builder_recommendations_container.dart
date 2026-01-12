import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/widget/customiz_courses_auto_of_semester/recommendations_container.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_state.dart';

class BlocBuilderRecommendationsContainer extends StatelessWidget {
  const BlocBuilderRecommendationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomizeCoursesCubit, CustomizeCoursesState>(
        builder: (context, state) {
      if (state.status == CustomizeCoursesStatus.succesGetCoursesUser) {
        return RecommendationsContainer(
          count: state.optionModel!.length,
        );
      }
      return const Skeletonizer(
        child: RecommendationsContainer(),
      );
    });
  }
}
