import 'package:flutter/material.dart';

import '../theme/colors_app.dart';
import '../theme/padding_app.dart';


class ButtonApp extends StatelessWidget {
  final String? text;
  final BoxDecoration? boxDecoration;
  final BorderRadius? borderRadius;
  final Widget? childWidget;
  final Color? colorButton;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final EdgeInsets? paddingButton;
  const ButtonApp(
      {super.key,
      this.text,
      this.paddingButton,
      this.onTap,
      this.boxDecoration,
      this.borderRadius,
      this.childWidget,
      this.colorButton,
      this.textStyle,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: paddingButton ?? PaddingApp.getOnlyPadding(0, 0, 0, 0),
      child: Container(
        height: height ?? media.height * .06,
        width: width ?? media.width * .75,
        decoration: boxDecoration ??
            BoxDecoration(color: colorButton ?? ColorsApp.secondColor,borderRadius: borderRadius ?? BorderRadius.circular(25.0)),
        child: TextButton(
            onPressed: onTap,
            child: childWidget ??
                Text(
                  text ?? '',
                  style: textStyle ??
                      const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                )),
      ),
    );
  }
}
