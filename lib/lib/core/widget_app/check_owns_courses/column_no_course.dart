import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/assets/app_assets.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/router/router_model.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/model/course/current_course.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/core/widget_app/check_owns_courses/buttons_check_owns_course.dart';
import 'package:smart_assistant_app/core/widget_app/check_owns_courses/row_no_course.dart';
import 'package:smart_assistant_app/core/widget_app/check_owns_courses/upper_bar_no_course.dart';

import '../../theme/text_style_app.dart';

class ColumnNoCourse extends StatelessWidget {
  final UserModel userModel;
  final List<CourseModel> courseRequest;
  final List<CurrentCourse> currentCourse;
  const ColumnNoCourse({super.key, required this.userModel, required this.courseRequest, required this.currentCourse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingApp.hor20,
      child: Column(
        children: [
           const UpprtBarCheckOwnsCourses(
            icon: Assets.assetsIconsDownload,
            text: 'لا توجد مواد محملة',
            subTitle: 'لم تقم بتنزيل أي مواد دراسية للفصل الحالي بعد. ابدأ الآن بتنزيل موادك لتتمكن من الوصول إلى المحاضرات والملفات الدراسية.',
          ),
          getHeight(20),
          Expanded(
            child: Column(
              children: [
                const RowNoCourse(
                  label: 'تنزيل سريع',
                  text: 'حمّل جميع موادك بضغطة واحدة',
                  backgroundColor: Color(0xFFe1eafd),
                  icon: Icons.download,
                  colorIcon: Colors.blue,
                ),
                
                getHeight(10),
                const RowNoCourse(
                  label: 'منظم ومرتب',
                  text: 'ملفاتك منظمة حسب  موادك',
                  backgroundColor: Color(0xFFf3e8ff),
                  icon: Icons.file_copy,
                  colorIcon: Color(0xFFaf65f8),
                ),
                getHeight(10),
                const RowNoCourse(
                  label: 'تحديثات فورية',
                  text: 'احصل على موادك بالملفات الجديدة',
                  backgroundColor: Color(0xFFddf9e8),
                  icon: Icons.update,
                  colorIcon: Colors.green,
                ),
                getHeight(20),
                ButtonsCheckOwnsCourse(
                   childWidge: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        getWidth(10),
                        Text(
                          'نزل موادك الآن',
                          style: TextStyleApp.font10White,
                        )
                      ],
                    ),
                   onTap: (){
                     context.pushNamed(RouterViews.chooseAllocateCourses , arguments: UserRequestCourseModel(userModel: userModel, courseRequest: courseRequest , currentCourse: currentCourse));
                   },
                  userModel: userModel,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
