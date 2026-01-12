import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';

import '../../../core/theme/box_decoration_app.dart';

class ContainerTextSelectCompletedCourses extends StatelessWidget {
  const ContainerTextSelectCompletedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * .1,
      width: double.infinity,
      decoration: BoxDecorationApp.whiteRaduis8BorderAllWidth03ColorGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeight(8),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromARGB(255, 187, 222, 251),
                  child: Icon(
                    Icons.question_mark_rounded,
                    color: Color.fromARGB(255, 66, 165, 245),
                    size: 14,
                  ),
                ),
              ],
            ),
            getWidth(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeight(5),
                Text(
                  'اختر المواد المنجزة',
                  style: TextStyleApp.font9Black,
                ),
                Text(
                  'حدد جميع المواد التي أكملتها\nبنجاح لنتمكن من تقديم توصيات أفضل لك',
                  style: TextStyleApp.font8Blue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
