import 'package:flutter/material.dart';

class CustomCircleIcon extends StatelessWidget {
  final Color? backGroundColor;
  final Color? iconColor;
  final IconData? icon;
  final Widget? widget;
  final double? size;
  final double? sizeIcon; 
  const CustomCircleIcon({super.key,  this.backGroundColor, this.iconColor, this.icon, this.widget, this.size, this.sizeIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 50,
      width: size ?? 50,
      decoration: BoxDecoration(
        color: backGroundColor ?? const Color.fromARGB(43, 255, 255, 255),
        shape: BoxShape.circle,
      ),
      child: widget ?? Icon(icon , size: sizeIcon , color: iconColor ?? Colors.white, ),
    );
  }
}