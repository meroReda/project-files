import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/router/router_model.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/model/course/current_course.dart';
import 'package:smart_assistant_app/model/user_model.dart';

import '../../../model/course_model.dart';

class DrawerModel {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  DrawerModel({required this.icon, required this.label, this.onTap});
}

List<DrawerModel> listDrawer(BuildContext context, UserModel userModel, List<CourseModel> courseRequest , List<CurrentCourse> currentCourse) {
  return [
    DrawerModel(
      icon: Icons.margin,
      label: "عرض المواد الموصى بها",
      onTap: () {
        context.pushNamed(RouterViews.chooseAllocateCourses,arguments: UserRequestCourseModel(userModel: userModel, courseRequest: courseRequest , currentCourse:  currentCourse));
      },
    ),
    DrawerModel(
        icon: Icons.school,
        label: "عرض مواد الفصل الدراسي",
        onTap: () {
          context.pushNamed(RouterViews.recommendedCourses,arguments: UserRequestCourseModel(userModel: userModel, currentCourse: currentCourse  , courseRequest: courseRequest));
        }
   ),
    DrawerModel(icon: Icons.format_list_numbered_rtl_sharp, label: "تقييمات" , 
     onTap: (){
     
     }
    ),
    DrawerModel(
      icon: Icons.file_copy_outlined,
      label: 'مناهج والمحاضرات'  , onTap : (){
         context.pushNamed(RouterViews.syllabusScreen , arguments: UserRequestCourseModel(userModel: userModel, courseRequest: courseRequest , currentCourse: currentCourse  ,));
    }
    ),
    DrawerModel(
        icon: Icons.settings,
        label: 'الملف الشخصي',
        onTap: () {
          context.pushNamed(RouterViews.profileScreen, arguments: userModel);
        }),
  ];
}
