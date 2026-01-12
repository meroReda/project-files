import 'package:flutter/material.dart';

import '../../helpers/size_box_responsive.dart';
import '../../theme/text_style_app.dart';
import '../../../view/profile/widget/profile/custom_circle_icon.dart';

class RowNoCourse extends StatelessWidget {
  final String label;
  final String text;
  final IconData icon;
  final Color colorIcon;
  final Color backgroundColor;
  const RowNoCourse({
    super.key,
    required this.label,
    required this.text,
    required this.icon,
    required this.colorIcon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * .07,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCircleIcon(
                  icon: icon,
                  iconColor: colorIcon,
                  backgroundColor: backgroundColor,
                  height: 40,
                  width: 40,
                ),
                getWidth(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyleApp.font10Black,
                    ),
                    Text(
                      text,
                      style: TextStyleApp.font8Grey,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
