import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/model/user_model.dart';

import '../../../../core/widget_app/button_app.dart';
import '../../../../view_model/customize_courses_of_semester/customize_courses_cubit.dart';

class ButtonConfirmCostomizeCoursesOfSemester extends StatelessWidget {
  final bool isConfirmEnabled;
  final UserModel userModel;
  const ButtonConfirmCostomizeCoursesOfSemester(
      {super.key, required this.isConfirmEnabled , required this.userModel});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ButtonApp(
      text: 'تأكيد',
      onTap: () {
        context.read<CustomizeCoursesCubit>().beforeRepo(context, userModel);
      },
      width: media.width * .35,
      colorButton: isConfirmEnabled ? const Color(0xFF925ef7) : const Color(0xFFe5e7eb),
    );
  }
}
