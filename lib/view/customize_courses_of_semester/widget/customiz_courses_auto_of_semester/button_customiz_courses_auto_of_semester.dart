import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_cubit.dart';

import '../../../../core/widget_app/button_app.dart';

class ButtonCustomizCoursesAutoOfSemester extends StatelessWidget {
  final bool? isConfirmEnabled;
  final String userId;
  const ButtonCustomizCoursesAutoOfSemester(
      {super.key, this.isConfirmEnabled = false , required this.userId});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ButtonApp(
      width: media.width * .35,
      onTap: () {
        if(isConfirmEnabled ==  true){
          context.read<CustomizeCoursesCubit>().insertCourse(userId);
        }
      },
      colorButton: isConfirmEnabled == true
          ? const Color(0xFF925ef7)
          : const Color(0xFFe5e7eb),
      text: 'تأكيد',
    );
  }
}
