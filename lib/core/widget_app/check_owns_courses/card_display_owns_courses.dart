import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/model/course/current_course.dart';
import 'package:smart_assistant_app/view/profile/widget/profile/custom_circle_icon.dart';

class CardDisplayOwnsCourses extends StatelessWidget {
  final List<CurrentCourse> currentCourse;
  const CardDisplayOwnsCourses({super.key, required this.currentCourse});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: PaddingApp.hor15,
        child: Column(
          children: [
            Center(
                child: Column(
              children: [
                Text(
                  currentCourse.length.toString(),
                  style: TextStyleApp.font12Blue,
                ),
                Text(
                  'مقررات دراسي ',
                  style: TextStyleApp.font9Grey,
                ),
              ],
            )),
            getHeight(10),
            Row(
              children: [
                const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                getWidth(10),
                Text(
                  'المواد المحملة',
                  style: TextStyleApp.font12Black
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            getHeight(10),
            SizedBox(
                height: MediaQuery.of(context).size.height * .32,
                child: GridView.builder(
                    itemCount: currentCourse.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 1,
                            childAspectRatio: 2.5,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF65c389),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: PaddingApp.getOnlyPadding(0, 0,5,0),
                            child: Row(
                              children: [
                                const CustomCircleIcon(
                                  height: 20,
                                  width: 20,
                                  icon: Icons.school_outlined,
                                  iconColor: Colors.white,
                                  backgroundColor: Color(0xFFa7e2bf),
                                ),
                                getWidth(7),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentCourse[index].name,
                                        style: TextStyleApp.font7White,
                                      ),
                                      Text(
                                        currentCourse[index].code,
                                        style: TextStyleApp.font7White,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
