import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/dailog/show_dialog.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';
import '../../../core/widget_app/list_view_app/list_view_display_courese.dart';
import '../../../view_model/completed_courses/completed_courses_state.dart';

class DisplayCoursesBlocBuilder extends StatelessWidget {
  const DisplayCoursesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompletedCoursesCubit, CompletedCoursesState>(
      builder: (context, state) {
        if (state.status == CompletedCoursesStatus.success) {
          return ListViewDisplayCourses(
            courseModel: state.filteredCourses!,
          );
        }
        return Center(
          child: Column(
            
            children: [
              getHeight(20),
              const CircularProgressIndicator(
                strokeAlign: 8,
              ),
              getHeight(20),
              const Text('جاري التحميل')
            ],
          ),
        );
      }, listener: (context, state) {
        if(state.status == CompletedCoursesStatus.error){
          DialogHelper.errorMessage(context, state.error!);
        }
      },
    );
  }
}
