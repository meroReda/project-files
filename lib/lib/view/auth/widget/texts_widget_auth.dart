import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';

class TextsWidgetAuth extends StatelessWidget {
  final String text;
  final String subTitle;
  const TextsWidgetAuth({super.key, required this.text, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getHeight(20),
        Text(
          text,
          style: TextStyle(
              fontSize: 12.sp,
              color: ColorsApp.primaryColor,
              fontWeight: FontWeight.w600),
        ),
        getHeight(5),
        Text(
          subTitle,
          style: TextStyleApp.font10Grey,
        )
      ],
    );
  }
}
