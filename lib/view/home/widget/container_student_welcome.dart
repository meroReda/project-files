import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_assistant_app/core/assets/app_assets.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/model/user_model.dart';
class ContainerStudentWelcome extends StatelessWidget {
  final UserModel userModel;
  const ContainerStudentWelcome({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * .15,
      width: media.width,
      decoration:  
      BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorsApp.primaryColor,
      ),


      child: Padding(
        padding: PaddingApp.getHorVer(15, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeight(10),
                Text(
                  'مرحباً، ${userModel.fullName} 👋',
                  style: TextStyleApp.font12White,
                ),
                Text(
                  'نتمنى لك يوماً دراسياً مثمراً',
                  style: TextStyleApp.font9White,
                ),
              ],
            ),
            Lottie.asset(Assets.assetsAnimationStudent),
          ],
        ),
      ),
    );
  }
}
