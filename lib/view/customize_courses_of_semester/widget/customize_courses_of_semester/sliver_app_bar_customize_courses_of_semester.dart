import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/box_decoration_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/custom_sliver_app_bar.dart';
import 'package:smart_assistant_app/model/course_model.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import '../../loading_bloc/customize_courses_of_semester/button_confirm_costomize_courses_of_semester_bloc_builder.dart';
class SliverAppBarCustomizeCoursesOfSemester extends StatelessWidget {
  final int? allUnit;
  final List<CourseModel>? selectedCourses;
  final double ? selectedUnits;
  final UserModel userModel;
  const SliverAppBarCustomizeCoursesOfSemester({super.key , this.allUnit , this.selectedCourses  , this.selectedUnits = 0.0 , required this.userModel});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return CustomSliverAppBar(
      pinned: true,
      expandedHeight: 200,
      backGroundColor: const Color(0xFFfdfdff),
      background: Column(
        children: [
          Padding(
            padding: PaddingApp.getHorVer(10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تخصيص مواد الفصل',
                  style: TextStyleApp.font12Black,
                ),
                ButtonConfirmCostomizeCoursesOfSemesterBlocBuilder(userModel: userModel,),
              ],
            ),
          ),
          getHeight(20),
          Container(
            width: media.width * .85,
            height: media.height * .1,
            decoration: BoxDecorationApp.ffffffRaduis8Border02ColorGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
                  child : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.computer,
                                color: Colors.blue,
                                size: 14,
                              ),
                              getWidth(4),
                              Text(
                                 selectedCourses == null ? '0 مواد محددة' : '${selectedCourses!.length}  مواد محددة',
                               
                                style: TextStyleApp.font10Black,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                allUnit == null ? '0' : allUnit.toString(),
                                style: TextStyleApp.font10Blue,
                              ),
                              getWidth(3),
                              Text(
                                '/ 21 وحدة',
                                style: TextStyleApp.font10Black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      getHeight(10),
                      ColorfulProgressIndicator(progress: selectedUnits!),
                    
                    ],
                  ),
            ),
                  
               
          
          ),
        ],
      ),
    );
  }
}

class ColorfulProgressIndicator extends StatelessWidget {
  final double progress;

  const ColorfulProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    Color getProgressColor() {
      if (progress >= 21) {
        return Colors.red;
      } else if (progress >= 16) {
        return Colors.orange;
      } else if (progress >= 10) {
        return Colors.blue;
      } else {
        return Colors.green;
      }
    }

    var media = MediaQuery.of(context).size;
    final double percentage = progress / 21;
    final double barWidth = media.width * 0.85 * percentage;
    return Container(
      width: media.width,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Stack(
        children: [
          Container(
            width: barWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  getProgressColor(),
                  getProgressColor().withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
