import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/custom_circle_icon.dart';

import '../../../../core/theme/box_decoration_app.dart';

class RecommendationsContainer extends StatelessWidget {
  final int? count;
  const RecommendationsContainer({super.key, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecorationApp.gradientColorCustom3ColrosNoRaduis(
              const Color(0xFF8734E1),
              const Color(0xFF4A6Cf7),
              const Color(0xFF5F97F6))
          .copyWith(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: PaddingApp.getHorVer(15, 15),
        child: Column(
          children: [
            Row(
              children: [
                const CustomCircleIcon(
                  backGroundColor: Color(0xFF8a69ee),
                  icon: Icons.stay_primary_portrait_outlined,
                ),
                getWidth(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'توصيات ذكية',
                        style: TextStyleApp.font10White.copyWith(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'قمنا بإعداد  $count خيارات مختلفة من المواد بناءً على تقدمك الأكاديمي',
                        style: TextStyleApp.font8White,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
