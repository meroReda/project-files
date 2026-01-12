import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/model/course/courses_user.dart';

import '../../../core/theme/colors_app.dart';

class OverallProgressCard extends StatelessWidget {
  final CoursesUser? coursesUser;
  const OverallProgressCard({super.key, this.coursesUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration:  
       BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color.fromARGB(170, 162, 165, 254),
             ColorsApp.primaryColor,
            ColorsApp.primaryColor, // البداية: أزرق
          ],
          stops: const [0.0, 0.5, 1.0], // التوقف عند 0% و 50% و 100%
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "التقدم الإجمالي",
                    style: TextStyleApp.font10Black.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                    textAlign: TextAlign.right,
                  ),

                  // النص الفرعي
                  Text(
                    "نظرة شاملة على مسيرتك الأكاديمية",
                    style: TextStyleApp.font10Grey.copyWith(
                      fontSize: 10,
                      color: Colors.white,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(106, 129, 143, 248),
                ),
                child: const Icon(
                  Icons.school,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          getHeight(20),
          ColumnReportUser(
            text: 'تقدم الوحدات',
            from: coursesUser == null
                ? 0
                : (coursesUser!.totalNumberOfCompletedUnits /
                        coursesUser!.totalNumbrtOfAllCoursesUnits) *
                    100,
            to: coursesUser == null
                ? 100
                : 100 -
                    (coursesUser!.totalNumberOfCompletedUnits /
                            coursesUser!.totalNumbrtOfAllCoursesUnits) *
                        100,
            textFromTo: coursesUser == null
                ? '0/0'
                : '${coursesUser!.totalNumberOfCompletedUnits} / ${coursesUser!.totalNumbrtOfAllCoursesUnits}',
          ),
          getHeight(20),
          ColumnReportUser(
            text: 'تقدم المواد',
            from: coursesUser == null
                ? 0
                : (coursesUser!.totalCompletedCourses /
                        coursesUser!.allCourses.length) *
                    100,
            to: coursesUser == null
                ? 100
                : 100 -
                    (coursesUser!.totalCompletedCourses /
                            coursesUser!.allCourses.length) *
                        100,
            textFromTo: coursesUser == null
                ? '0/0'
                : '${coursesUser!.totalCompletedCourses} / ${coursesUser!.allCourses.length}',
          ),
        ],
      ),
    );
  }
}

class ColumnReportUser extends StatelessWidget {
  const ColumnReportUser({
    super.key,
    this.rate = "0",
    required this.text,
    required this.textFromTo,
    required this.from,
    required this.to,
  });
  final String text;
  final String textFromTo;
  final double from;
  final double to;
  final String? rate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyleApp.font10White
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              textFromTo,
              style: TextStyleApp.font10White
                  .copyWith(fontWeight: FontWeight.w700),
            )
          ],
        ),
        getHeight(10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 10,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 164, 166, 169),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                flex: from.toInt(), // 63% من العرض
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // أخضر
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              Expanded(
                flex: to.toInt(), // 37% المتبقية
                child: Container(),
              ),
            ],
          ),
        ),
        getHeight(5),
        Center(
          child: Text(
            '${from.toStringAsFixed(2)} %',
            style:
                TextStyleApp.font11White.copyWith(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
