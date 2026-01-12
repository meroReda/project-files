import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/course_selection_mode.dart';

class ContainerChooseAllocateCourse extends StatelessWidget {
  final CourseSelectionMode courseSelectionMode;
  const ContainerChooseAllocateCourse(
      {super.key, required this.courseSelectionMode});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * .16,
      width: courseSelectionMode.isSelected ? media.width *.95 :  media.width * .9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: courseSelectionMode.isSelected == true ? Border.all(width:2 ,  color: courseSelectionMode.colorIcon) : null,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey
            
            ),
          ]
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: courseSelectionMode.backgroundColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Icon(courseSelectionMode.icon, color: courseSelectionMode.colorIcon,),
            ), 
            getWidth(15),
            // نستخدم Expanded هنا لتمكين النصوص من أخذ المساحة المتبقية
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getHeight(10),
                  Text(
                    courseSelectionMode.title, 
                    style: TextStyleApp.font10Black.copyWith(fontWeight: FontWeight.w500),
                    maxLines: 1, // يمكن تغيير عدد الأسطر حسب الحاجة
                 
                  ),
                  // نستخدم Expanded أيضًا للنص الفرعي ليملأ المساحة المتبقية ويسمح بتعدد الأسطر
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseSelectionMode.subtitle, 
                          style: TextStyleApp.font9Grey, 
                          textAlign: TextAlign.start, // بدلاً من center ليكون منسجمًا مع بداية النص
                          maxLines: 3, // أو أي عدد مناسب
                          
                        ),
                        Row(
                          children: List.generate(courseSelectionMode.options.length,(index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                    width: media.width *.12,
                                    height: media.height *.02,
                                    decoration: BoxDecoration(
                                      color: courseSelectionMode.options[index].color.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                   child: Text(courseSelectionMode.options[index].text , textAlign: TextAlign.center, style: TextStyleApp.font8Grey.copyWith(color: courseSelectionMode.options[index].color),),
                              ),
                            );
                          })
                        )
                      ],
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