import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/assets/app_assets.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';

class SelectionOfCompletedCourses extends StatelessWidget {
  final int countCourse;
  const SelectionOfCompletedCourses({super.key, required this.countCourse});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.assetsIconsSelect , height: 30, width: 30,),
        getWidth(5),
        Text('المواد المختارة: $countCourse مادة' ),
      ],
    );
  }
}
