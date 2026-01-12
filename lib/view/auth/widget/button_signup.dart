import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/widget_app/button_app.dart';
import 'package:smart_assistant_app/view_model/auth/auth_logic.dart';
import '../../../core/theme/colors_app.dart';

class ButtonSignup extends StatelessWidget {
  const ButtonSignup({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ButtonApp(
      height: media.height * .05,
      width: media.width * .65,
      colorButton: ColorsApp.primaryColor,
      text: 'إنشاء حسابك الآن',
      onTap: () {
        AuthLogic.buttonSignUp(context);
      },
    );
  }
}
