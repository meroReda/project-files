import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/core/router/router_views.dart';
import 'package:smart_assistant_app/core/server/local_storage.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/button_app.dart';

class WidgetButtonsOnboarding extends StatelessWidget {
  final int? selectedIndex;

  const WidgetButtonsOnboarding({super.key, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding:
          PaddingApp.getOnlyPadding(30, 15, 15, selectedIndex == 2 ? 20 : 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                LocalStorage.saveOnboarding("skip");
                context.pushAndRemoveUntil(RouterViews.login);
              },
              child: Text(
                'تخطي',
                style: TextStyleApp.font11Black
                    .copyWith(fontWeight: FontWeight.w500),
              )),
          if (selectedIndex != 2)
            Container(
              height: media.height * .15,
              width: media.width * .1,
              decoration: BoxDecoration(
                color: ColorsApp.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          if (selectedIndex == 2)
            ButtonApp(
              onTap: () {
                LocalStorage.saveOnboarding("skip");
                context.pushAndRemoveUntil(RouterViews.login);
              },
              text: 'إبدا الآن',
              colorButton: ColorsApp.primaryColor,
              width: media.width * .25,
            ),
        ],
      ),
    );
  }
}
