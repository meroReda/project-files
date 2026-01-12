import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';

class LoadingButton extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final double?sizeRaduis;
  final Widget? widget;

  const LoadingButton(
      {super.key, this.text, this.widget , this.textStyle , this.sizeRaduis});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
             CupertinoActivityIndicator(
              color: Colors.white,
              radius: sizeRaduis?? 25,
            ),
        getWidth(10),
        Text(
          text ?? 'جاري التحميل',
          style: textStyle?? TextStyleApp.font12White.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
