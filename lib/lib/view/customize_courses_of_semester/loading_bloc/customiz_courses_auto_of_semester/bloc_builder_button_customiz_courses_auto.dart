import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_assistant_app/core/helpers/dailog/show_dialog.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/widget/customiz_courses_auto_of_semester/button_customiz_courses_auto_of_semester.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_state.dart';

import '../../../../core/router/router_views.dart';

class BlocBuilderButtonCustomizCoursesAuto extends StatelessWidget {
  final UserModel userModel;
  const BlocBuilderButtonCustomizCoursesAuto({super.key , required this.userModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomizeCoursesCubit, CustomizeCoursesState>(
        builder: (context, state) {
          if (state.status == CustomizeCoursesStatus.loading) {
            return Skeletonizer(child: ButtonCustomizCoursesAutoOfSemester(userId: userModel.userID,));
          }
          return ButtonCustomizCoursesAutoOfSemester(
            isConfirmEnabled: state.isConfirmEnabled,
            userId: userModel.userID,
          );
        },
        listener: (context, state) {
          if (state.status == CustomizeCoursesStatus.success){
            context.pushReplacementNamed(RouterViews.home , arguments: userModel);
          }
          else if(state.status == CustomizeCoursesStatus.error){
            DialogHelper.errorMessage(context, state.errorMessage!);
          }
        });
  }
}
