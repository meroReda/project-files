import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/view_model/auth/auth_logic.dart';

import '../../../core/theme/text_style_app.dart';
import '../../../core/widget_app/button_app.dart';

class RowButtonLoginAndForgetPassoword extends StatelessWidget {
  const RowButtonLoginAndForgetPassoword({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'هل نسيت كلمة المرور؟',
          style: TextStyleApp.font9Black.copyWith(
              color: ColorsApp.primaryColor, fontWeight: FontWeight.w600),
        ),
         ButtonApp(
          onTap: () {
            AuthLogic.buttonLogin(context);
          },
          height: media.height * .05,
          width: media.width * .35,
          colorButton: ColorsApp.primaryColor,
          text: 'تسجيل دخول',
        )
      ],
    );
  }
}
