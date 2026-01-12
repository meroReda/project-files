import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/router/router_model.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/button_app.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import '../../../../model/course_model.dart';
import '../../../../view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import '../../../../view_model/customize_courses_of_semester/customize_courses_state.dart';

class ButtonChoosAllocateCoursesBlocBuilder extends StatelessWidget {
  final UserModel userModel;
  final List<CourseModel> courseRequest;
  const ButtonChoosAllocateCoursesBlocBuilder({super.key , required this.userModel, required this.courseRequest});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocBuilder<CustomizeCoursesCubit, CustomizeCoursesState>(
        builder: (context, state) {
      final cubit      = context.read<CustomizeCoursesCubit>();
      if (state.status == CustomizeCoursesStatus.systemSelect) {
        return ButtonApp(
          onTap: (){
            cubit.initialState();
            context.pushNamed(RouterViews.customizCoursesAutoOfSemester , arguments: UserRequestCourseModel(userModel: userModel, courseRequest: courseRequest));
          },
          width: media.width * .9,
          text: 'متابعة',
          textStyle:TextStyleApp.font12White.copyWith(fontWeight: FontWeight.w900),
          borderRadius: BorderRadius.circular(12),
          colorButton: const Color(0xFF5577f6),
        );
      } else if (state.status == CustomizeCoursesStatus.customSelect) {
        return ButtonApp(
          width: media.width * .9,
          text: 'متابعة',
          onTap: () { 
            cubit.initialState();
            context.pushNamed(RouterViews.customizeCoursesOfSemester ,arguments: userModel);
          },
          textStyle:
              TextStyleApp.font12White.copyWith(fontWeight: FontWeight.w900),
          borderRadius: BorderRadius.circular(12),
          colorButton: const Color(0xFFf46443),
        );
      }
      return ButtonApp(
        width: media.width * .9,
        text: 'طريقة التسجيل',
        textStyle: TextStyleApp.font12White.copyWith(fontWeight: FontWeight.w900),
        borderRadius: BorderRadius.circular(12),
        colorButton: const Color(0xFFe5e7eb),
      );
    });
  }
}
