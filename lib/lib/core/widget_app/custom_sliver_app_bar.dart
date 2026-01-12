
import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import '../theme/colors_app.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String? title;
  final double expandedHeight;
  final Widget? leading;
  final List<Widget>? action;
  final Color? backGroundColor;
  final bool? pinned;
  final Widget? background;
  final Color? colorBackGround;
  final TextStyle? textStyle;

  const CustomSliverAppBar({
    super.key,
    this.title,
    this.textStyle,
    this.background,
    this.expandedHeight = 200.0,
    this.leading,
    this.action,
    this.backGroundColor,
    this.pinned,

    this.colorBackGround,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading ?? const SizedBox.shrink(),
      expandedHeight: expandedHeight,
      actions: action ?? [
        const SizedBox.shrink(),
      ],
      title: title == null ? null : Text(title! , style: textStyle?? TextStyleApp.font10Primary,),
      backgroundColor: backGroundColor ?? ColorsApp.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: background,
      ),
      pinned: pinned == null ? false : true,
    );
  }
}
