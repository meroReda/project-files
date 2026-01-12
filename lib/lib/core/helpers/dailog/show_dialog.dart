import 'package:flutter/material.dart';

import '../../theme/text_style_app.dart';

class DialogHelper {
  static showMessage(BuildContext context, String message, Color? color,
      TextStyle? textStyle) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Center(
        child: Text(
          message,
          style: textStyle ?? TextStyleApp.font10White,
        ),
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  static errorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Center(
        child: Text(
          message,
          style: TextStyleApp.font10White,
        ),
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  static noConntected(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Center(
        child: Text(
          'لا يوجد لديك إتصال بالإنترنت',
          style: TextStyleApp.font10White,
        ),
      ),
      duration: const Duration(seconds: 2),
    ));
  }
}
