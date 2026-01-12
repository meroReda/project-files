import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/router/router_model.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/check_owns_courses/buttons_check_owns_course.dart';
import 'package:smart_assistant_app/core/widget_app/check_owns_courses/upper_bar_no_course.dart';
import 'package:smart_assistant_app/model/course/current_course.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/model/user_model.dart';

import '../../assets/app_assets.dart';
import '../../helpers/size_box_responsive.dart';
import '../../theme/padding_app.dart';
import 'card_display_owns_courses.dart';

class ColumnOwn extends StatelessWidget {
  final UserModel userModel;
  final List<CurrentCourse> currentCourse;
  final List<CourseModel> courseRequest;
  const ColumnOwn(
      {super.key, required this.userModel, required this.currentCourse, required this.courseRequest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingApp.hor20,
      child: Column(
        children: [
          const UpprtBarCheckOwnsCourses(
            icon: Assets.assetsIconsSuccess,
            text: 'تم التنزيل بنجاح !  🎉 ',
            subTitle:
                'تم تنزيل جميع مواد الفصل الدراسي الحالي بنجاح يمكنك الآن الوصول إلى جميع الملفات والمحاضرات',
          ),
          getHeight(20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CardDisplayOwnsCourses(
                    currentCourse: currentCourse,
                  ),
                  getHeight(10),
                  ButtonsCheckOwnsCourse(
                    childWidge: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                        getWidth(10),
                        Text(
                          'عرض الملفات',
                          style: TextStyleApp.font10White,
                        )
                      ],
                    ),
                    onTap: () {
                      context.pushNamed(RouterViews.syllabusCourse , arguments: UserRequestCourseModel(userModel: userModel, courseRequest: courseRequest , currentCourse: currentCourse));
                    },
                    userModel: userModel,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
