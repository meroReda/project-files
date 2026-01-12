import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';

class WidgetRowCircleContainer extends StatelessWidget {
  final int selectedIndex;
  const WidgetRowCircleContainer({super.key , required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingApp.getHorVer(20, 20),
      child: Row(
        children: List.generate(3, (index) {
          return Padding(
            padding: PaddingApp.getOnlyPadding(0 ,10,0,0),
            child: Container(
              height:18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == index ? ColorsApp.primaryColor : Colors.white,
                border: Border.all(width: 0.5, color: ColorsApp.primaryColor),
              ),
            ),
          );
        }),
      ),
    );
  }
}
