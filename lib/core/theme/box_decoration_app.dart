import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';

class BoxDecorationApp {
  static BoxDecoration whiteRaduis25 = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
  );

  static BoxDecoration whiteRaduis8BorderAllWidth03ColorGrey = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 0.3, color: ColorsApp.bgScafoldGrey));

  static BoxDecoration gradientColorCustom3ColrosRaduis15(
      Color fColor, Color sColor, Color tColor) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15), // زوايا مدورة
      gradient: LinearGradient(
        begin: Alignment.topCenter, // بداية من الأعلى
        end: Alignment.bottomCenter, // نهاية في الأسفل
        colors: [
          fColor,
          sColor,
          tColor,
        ],
      ),
    );
  }

   static BoxDecoration gradientColorCustom3ColrosNoRaduisBoxShapeCircle(
      Color fColor, Color sColor, Color tColor) {
    return BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topCenter, // بداية من الأعلى
        end: Alignment.bottomCenter, // نهاية في الأسفل
        colors: [
          fColor,
          sColor,
          tColor,
        ],
      ),
    );
  }

   static BoxDecoration gradientColorCustom3ColrosNoRaduis(
      Color fColor, Color sColor, Color tColor) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter, // بداية من الأعلى
        end: Alignment.bottomCenter, // نهاية في الأسفل
        colors: [
          fColor,
          sColor,
          tColor,
        ],
      ),
    );
  }


  static BoxDecoration whiteRaduis25BorderWiddth04ColorGrey = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(width: 0.4, color: Colors.grey));

  static BoxDecoration ffffffRaduis8Border02ColorGrey = BoxDecoration(
      color: const Color(0xFFffffff),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 0.2, color: Colors.grey));

  static BoxDecoration customColorRaduis24ListGradient(Color? color, List<Color>? gradient) {
  return BoxDecoration(
    color: color,
    gradient: gradient == null ? null : LinearGradient(colors: gradient),
    borderRadius: BorderRadius.circular(24),
  );
}
}
