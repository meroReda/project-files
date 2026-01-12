import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';

import '../../../core/theme/colors_app.dart';
import '../../../core/theme/text_style_app.dart';
import '../../../core/widget_app/button_app.dart';

class ButtonLoginLoading extends StatelessWidget {
  const ButtonLoginLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ButtonApp(
      childWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'جاري تحميل',
            style: TextStyleApp.font10White,
          ),
          getWidth(20),
          const CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
      height: media.height * .05,
      width: media.width * .55,
      colorButton: ColorsApp.primaryColor,
    );
  }
}
