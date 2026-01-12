import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_assistant_app/core/theme/box_decoration_app.dart';
import 'package:smart_assistant_app/model/course/courses_user.dart';
import '../../../core/helpers/size_box_responsive.dart';
import '../../../core/theme/padding_app.dart';
import '../../../core/theme/text_style_app.dart';
import '../../../core/widget_app/button_app.dart';

class CompletedOfCourses extends StatelessWidget {
  final int completedUnit;
  final int allUnit;
  final double unitPoint;
  final double percentComplete;
  final CoursesUser coursesUser;
  const CompletedOfCourses(
      {super.key,
      required this.allUnit,
      required this.unitPoint,
      required this.percentComplete,
      required this.completedUnit,
      required this.coursesUser});
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: media.height * .2,
        width: media.width,
        decoration: BoxDecorationApp.whiteRaduis25BorderWiddth04ColorGrey,
        child: Column(
          children: [
            getHeight(10),

            Row(
              children: [
                Padding(
                  padding: PaddingApp.getHorVer(15, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' انجزت $completedUnit',
                  style: TextStyleApp.font12Blue
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  'من $allUnit وحدة معتمدة',
                  style: TextStyleApp.font9Grey,
                )
              ],
                  ),
                ),
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 4,
                    animation: true,
                    percent: percentComplete,
                    center:
                        Text('$unitPoint%', style: TextStyleApp.font10Black),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
              ],
            ),
            getHeight(10),
            ButtonApp(
              colorButton: Colors.blue,
              height: media.height * .05,
              width: media.width * .65,
              text: 'اكتشف موادك القادمة',
            )
          ],
        ),
      ),
    );
  }
}
