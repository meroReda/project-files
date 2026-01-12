import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? center;
  final Color? backgroundColor;
  final Widget?leading;
  final TextStyle? textStyle;
  final double? toolbarHeight;
  final Widget? action;
  final Widget? widgettitle;
  const CustomAppBar({super.key,  this.title, this.center = true, this.backgroundColor, this.leading, this.textStyle, this.toolbarHeight, this.action , this.widgettitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: center,
      backgroundColor: backgroundColor ?? ColorsApp.primaryColor,
      toolbarHeight: toolbarHeight?? 40,
      leading:  leading ,
      actions: [
        action?? const SizedBox.shrink()
      ],
      title: widgettitle ?? (title == null ? null :  Text(title! , style: textStyle ?? TextStyleApp.font10White,)),
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}