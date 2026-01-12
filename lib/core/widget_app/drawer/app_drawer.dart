import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/assets/app_assets.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/drawer/drawer_model.dart';
import 'package:smart_assistant_app/model/course/current_course.dart';
import 'package:smart_assistant_app/model/user_model.dart';

import '../../../model/course_model.dart';
import '../../helpers/size_box_responsive.dart';
import '../../theme/colors_app.dart';

class AppDrawer extends StatelessWidget {
  final UserModel userModel;
  final List<CourseModel> courseRequest;
  final List<CurrentCourse> currentCourse;
  const AppDrawer({super.key, required this.userModel, required this.courseRequest , required this.currentCourse});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: ColorsApp.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage(Assets.assetsImagesLogoNoBackgroundpng)),
                  getHeight(20),
                  Text(userModel.fullName, style: TextStyleApp.font18White),
                  Text(
                    userModel.email,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: List.generate(listDrawer(context,userModel , courseRequest , currentCourse).length, (index) {
                    final list = listDrawer(context,userModel , courseRequest , currentCourse);
                    return buildDrawerItem(context,
                        icon: list[index].icon,
                        title: list[index].label,
                        onTap: list[index].onTap);
                  })),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback? onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: ColorsApp.primaryColor,
      ),
      title: Text(
        title,
        style: TextStyleApp.font9Black,
      ),
      onTap: onTap,
      trailing: const Icon(
        Icons.arrow_back_ios,
        size: 12,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
