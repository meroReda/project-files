import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../assets/app_assets.dart';
import '../../theme/colors_app.dart';
import '../../widget_app/button_app.dart';
import '../size_box_responsive.dart';

class DialogSucces extends StatelessWidget {
  final String text;
  final VoidCallback ?onTap;
  const DialogSucces({super.key, required this.text , this.onTap});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: ColorsApp.bgHome,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(text)),
              getHeight(20),
              Center(
                  child: Lottie.asset(Assets.assetsAnimationSuccess, height: media.height * .2)),
              getHeight(20),
              Center(
                child: ButtonApp(
                  colorButton: Colors.green,
                  width: media.width * .45,
                  text: 'موافق',
                  onTap: onTap,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
