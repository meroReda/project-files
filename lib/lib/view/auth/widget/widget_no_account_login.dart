import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';

import '../../../core/theme/text_style_app.dart';

class WidgetNoAccountLogin extends StatelessWidget {
  final String title;
  final String subTitle;
  const WidgetNoAccountLogin({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyleApp.font10Grey,
        ),
        getWidth(3),
        GestureDetector(
          onTap: () {
            if(subTitle == 'سجل دخولك الآن') {
              context.pushNamed(RouterViews.login);
            } else {
              context.pushNamed(RouterViews.signup);
            }
          },
          child: Text(
            subTitle,
            style: TextStyleApp.font11Primary,
          ),
        ),
      ],
    );
  }
}
