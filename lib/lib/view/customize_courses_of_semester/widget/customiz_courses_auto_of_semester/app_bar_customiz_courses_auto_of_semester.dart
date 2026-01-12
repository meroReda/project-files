import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/custom_app_bar.dart';
import '../../../../model/user_model.dart';
import '../../loading_bloc/customiz_courses_auto_of_semester/bloc_builder_button_customiz_courses_auto.dart';

class AppBarCustomizCoursesAutoOfSemester extends StatelessWidget implements PreferredSizeWidget {
  final UserModel userModel;
  const AppBarCustomizCoursesAutoOfSemester({super.key , required this.userModel});

  @override
  Widget build(BuildContext context) {
      return CustomAppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xFFfdfdff),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        widgettitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المواد الموصى بها',
                  style: TextStyleApp.font10White
                      .copyWith(color: const Color(0xFF9670ef)),
                ),
                Text(
                  'اختر الخيار الأنسب لك',
                  style: TextStyleApp.font8Grey,
                ),
              ],
            ),
           BlocBuilderButtonCustomizCoursesAuto(userModel: userModel,),
          ],
        ),
      );
    
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
