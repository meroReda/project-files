import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';

import '../../../core/helpers/size_box_responsive.dart';
import '../../../core/theme/text_style_app.dart';
import '../../../core/widget_app/button_app.dart';

class ButtonSaveCoursesSelected extends StatelessWidget {
  final UserModel userModel;
  const ButtonSaveCoursesSelected({super.key , required this.userModel});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompletedCoursesCubit>();
    return Padding(
      padding: PaddingApp.ver10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonApp(
            onTap: (){
              cubit.inserCourses(userModel, context);
            },
            width: MediaQuery.of(context).size.width*.85,
            childWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 14,
                ),
                getWidth(10),
                Text(
                  'حفظ المواد المحددة ',
                  style: TextStyleApp.font10White,
                )
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            colorButton: Colors.blue,
          ),
        ],
      ),
    );
  }
}
