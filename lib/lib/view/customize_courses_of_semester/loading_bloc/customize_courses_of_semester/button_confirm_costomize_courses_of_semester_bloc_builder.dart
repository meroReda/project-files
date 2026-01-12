import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/loading_bloc/customize_courses_of_semester/button_confirm_costomize_courses_of_semester_loading.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/widget/customize_courses_of_semester/button_confirm_costomize_courses_of_semester.dart';

import '../../../../core/server/local_storage.dart';
import '../../../../view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import '../../../../view_model/customize_courses_of_semester/customize_courses_state.dart';

class ButtonConfirmCostomizeCoursesOfSemesterBlocBuilder extends StatelessWidget {
  final UserModel userModel;
  const ButtonConfirmCostomizeCoursesOfSemesterBlocBuilder({super.key , required this.userModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomizeCoursesCubit, CustomizeCoursesState>(
      builder: (context, state) {
        if (state.status == CustomizeCoursesStatus.loading) {
          return const ButtonConfirmCostomizeCoursesOfSemesterLoading();
        }
        return ButtonConfirmCostomizeCoursesOfSemester(isConfirmEnabled: state.isConfirmEnabled , userModel: userModel,);
      },
      listener: (context, state) {
        if (state.status == CustomizeCoursesStatus.success) {
          LocalStorage.customizeCoursesOfSemester('save');
          context.pushAndRemoveUntil(RouterViews.home,arguments: userModel);
        }
      },
    );
  }
}
