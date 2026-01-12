import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';

class SimpleRequirementCard extends StatelessWidget {
  const SimpleRequirementCard({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * .12,
      width: media.width * .9,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1), // لون خلفية فاتح (أصفر باهت)
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFFFECB3), // لون حدود
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
              width: 45,
              child: Icon(
                Icons.info_outline_rounded,
                color: Color(0xFFFF9800), // لون برتقالي
                size: 24,
              ),
            ),
            getWidth(5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'معلومة مهمة',
                    textAlign: TextAlign
                        .start, // بدلاً من center ليكون منسجمًا مع بداية النص
                    maxLines: 3, // أو أي عدد مناسب
                    style: TextStyleApp.font10Black.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,

                      color: const Color(0xFFE65100), // لون برتقالي داكن
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign
                          .start, // بدلاً من center ليكون منسجمًا مع بداية النص
                      maxLines: 3, // أو أي عدد مناسب

                      'يجب أن يكون مجموع الوحدات المختارة بين 12 و 21 وحدة دراسية',
                      style: TextStyleApp.font9Grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
