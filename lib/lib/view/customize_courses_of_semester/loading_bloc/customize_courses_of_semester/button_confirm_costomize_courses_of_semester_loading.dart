import 'package:flutter/material.dart';

import '../../../../core/theme/text_style_app.dart';
import '../../../../core/widget_app/button_app.dart';
import '../../../../core/widget_app/loading_button.dart';

class ButtonConfirmCostomizeCoursesOfSemesterLoading extends StatelessWidget {
  const ButtonConfirmCostomizeCoursesOfSemesterLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ButtonApp(
        width: media.width * .35,
        childWidget: LoadingButton(
          sizeRaduis: 10,
          textStyle: TextStyleApp.font8White,
        ));
  }
}
