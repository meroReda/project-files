import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import '../../theme/box_decoration_app.dart';

class UpprtBarCheckOwnsCourses extends StatelessWidget {
  final String icon;
  final String text;
  final String subTitle;
  const UpprtBarCheckOwnsCourses({super.key , required this.icon, required this.text, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        getHeight(30),
        Container(
          height: media.height * .12,
          decoration:  BoxDecorationApp.gradientColorCustom3ColrosNoRaduisBoxShapeCircle(const Color(0xFF8734E1),const Color(0xFF4A6Cf7),const Color(0xFF5F97F6)),
          child:  Center(
            child: Image.asset(icon),
          ),
        ),
        getHeight(10),
        Text(
          text,
          style: TextStyleApp.font12Black.copyWith(fontWeight: FontWeight.w600),
        ),
        getHeight(10),
        Text(
          textAlign: TextAlign.center,
          subTitle,
          style: TextStyleApp.font9Grey,
        ),
      ],
    );
  }
}
