import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/core/server/local_storage.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view/completed_courses/widget/button_save_courses_selected.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_state.dart';

class ButtonCompletedCoursesBlocBuilder extends StatelessWidget {
  final UserModel userModel;
  const ButtonCompletedCoursesBlocBuilder({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompletedCoursesCubit, CompletedCoursesState>(
      builder: (context, state) {
        return ButtonSaveCoursesSelected(userModel: userModel);
      },
      listener: (context, state) async {
        if (state.status == CompletedCoursesStatus.insertCourses) {
          userModel.isTrue = true;
          LocalStorage.clearUser();
          LocalStorage.saveUser(jsonEncode(userModel.toJson()));
          context.pushAndRemoveUntil(RouterViews.home, arguments: userModel);
        }
      },
    );
  }
}
