import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_assistant_app/core/helpers/dailog/show_dialog.dart';
import '../../../../view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import '../../../../view_model/customize_courses_of_semester/customize_courses_state.dart';
import '../../widget/customiz_courses_auto_of_semester/list_view_customiz_course_auto_of_semester.dart';

class BlocBuilderListViewCustomizCoureseAuto extends StatelessWidget {
  const BlocBuilderListViewCustomizCoureseAuto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomizeCoursesCubit, CustomizeCoursesState>(
        builder: (context, state) {
      if (state.status == CustomizeCoursesStatus.succesGetCoursesUser) {
        return ListViewCustomizCourseAutoOfSemester(
          selectedOpt: state.selectedOpt,
          optionModel: state.optionModel,
        );
      }
      return const Skeletonizer(
        child: ListViewCustomizCourseAutoOfSemester(),
      );
    } , listener: (context , state){
      if (state.status == CustomizeCoursesStatus.error){
        DialogHelper.errorMessage(context, state.errorMessage!);
      }
    },
    
    );
  
  }
}