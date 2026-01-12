import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_state.dart';

import '../widget/container_text_select_completed_courses.dart';
import '../widget/selection_of_completed_courses.dart';

class WidgetDisplayTextsCoursesComplaetedBlocBuilder extends StatelessWidget {
  const WidgetDisplayTextsCoursesComplaetedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedCoursesCubit, CompletedCoursesState>( builder: (context, state) {
      int count = state.selectedCourses ==  null ? 0 : state.selectedCourses!.length;
      if (count == 0) {
        return const ContainerTextSelectCompletedCourses();
      }
      return SelectionOfCompletedCourses(countCourse: count);
    });
  }
}
