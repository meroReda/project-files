import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';

import '../../../../core/assets/app_assets.dart';
import '../../../../core/theme/box_decoration_app.dart';

class UpperBarChooseAllocateCourses extends StatelessWidget {
  const UpperBarChooseAllocateCourses({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        getHeight(30),
        Container(
          height: media.height * .12,
          decoration:  BoxDecorationApp.gradientColorCustom3ColrosNoRaduisBoxShapeCircle(const Color(0xFF8734E1),const Color(0xFF4A6Cf7),const Color(0xFF5F97F6)),
          child: Center(
            child: Image.asset(Assets.assetsIconsChoose)
          ),
        ),
        getHeight(10),
        Text(
          'كيف تريد اختيار موادك؟',
          style: TextStyleApp.font12Black.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          'اختر الطريقة الأنسب لك',
          style: TextStyleApp.font10Black,
        ),
      ],
    );
  }
}
