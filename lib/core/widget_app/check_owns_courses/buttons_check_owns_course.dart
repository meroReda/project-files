import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/button_app.dart';
import 'package:smart_assistant_app/model/user_model.dart';


class ButtonsCheckOwnsCourse extends StatelessWidget {
  final UserModel userModel;
  final Widget? childWidge;
  final VoidCallback? onTap;
  const ButtonsCheckOwnsCourse(
      {super.key,
      required this.userModel,
      required this.childWidge,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonApp(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .06,
          onTap: () {
            context.pushReplacementNamed(RouterViews.home,
                arguments: userModel);
          },
          colorButton: Colors.white,
          boxDecoration: BoxDecoration(
              color: const Color(0xFFffffff),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 0.3)),
          text: 'العودة للرئيسية',
          textStyle: TextStyleApp.font11Black,
        ),
      ],
    );
  }
}
