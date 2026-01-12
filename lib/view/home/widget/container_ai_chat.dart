import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_assistant_app/core/assets/app_assets.dart';
import 'package:smart_assistant_app/core/widget_app/button_app.dart';
import 'package:smart_assistant_app/model/user_model.dart';

import '../../../core/helpers/size_box_responsive.dart';
import '../../../core/theme/colors_app.dart';
import '../../../core/theme/padding_app.dart';
import '../../../core/theme/text_style_app.dart';

class ContainerAiChat extends StatelessWidget {
  final UserModel userModel;
  const ContainerAiChat({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * .12,
      width: media.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color.fromARGB(170, 162, 165, 254),
             ColorsApp.primaryColor,
            ColorsApp.primaryColor, // البداية: أزرق
          ],
          stops: const [0.0, 0.5, 1.0], // التوقف عند 0% و 50% و 100%
        ),
      ),
      child: Padding(
        padding: PaddingApp.getHorVer(10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                    height: media.height * .15,
                    width: media.width * .15,
                    child: Lottie.asset(Assets.assetsAnimationAi)),
                getWidth(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getHeight(20),
                    Text(
                      'عونا متاح الآن',
                      style: TextStyleApp.font11White,
                    ),
                    Expanded(
                      child: Text(
                        'اسألني عن أي شيء يتعلق بدراستك',
                        style: TextStyleApp.font7White,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ButtonApp(
              width: media.width * .22,
              height: media.height * .05,
              textStyle: TextStyleApp.font7White.copyWith(color: const Color.fromARGB(255, 162, 165, 254), fontWeight: FontWeight.bold),
              text: 'إبدا بالمحادثة',
              colorButton: const Color.fromARGB(255, 255, 255, 255),
            )
          ],
        ),
      ),
    );
  }
}
