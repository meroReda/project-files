import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';

class WidgetUpperBarCompletedCourses extends StatelessWidget {
  const WidgetUpperBarCompletedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'للطلبة الملتحقين في الفصل الدراسي الخريف 2022 وما بعده',
      style: TextStyleApp.font8Black.copyWith(fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    );
  }
}
