import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/custom_circle_icon.dart';
import 'package:smart_assistant_app/model/option_model.dart';
class CardCourseCustomizCourseAuto extends StatelessWidget {
  final OptionModel? optionModel;
  final int? optionNumber;
  final bool? selectedOpt;
  const CardCourseCustomizCourseAuto(
      {super.key, this.optionModel, this.optionNumber = 0 , this.selectedOpt = false});

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.white,
      elevation: 6,
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: BorderSide(
        
        width: 1 , color: selectedOpt == true ? Colors.blue : Colors.white
      )
     ),
      child: Padding(
        padding: PaddingApp.getHorVer(0, 15),
        child: Column(
          children: [
            Padding(
              padding: PaddingApp.hor15,
              child: builUpperBarCardCourseCustomizCourseAuto(
                  label: optionModel == null
                      ? 'خيار رقم 1'
                      : optionModel!.optionName,
                  optionNumber: optionNumber!+1,
                  countCourse:
                      optionModel == null ? 0 : optionModel!.courses.length),
            ),
            getHeight(10),
            Padding(
                padding: PaddingApp.hor10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContinerUnitAndLevelCourseCustomizCourseAuto(
                    backGroundColor: const Color(0xFFf2f5fe),
                    icon: Icons.computer,
                     context: context,
                    colorIcon: Colors.blue,
                    label: 'الوحدات',
                    value: optionModel == null
                        ? '0'
                        : optionModel!.totalUnits.toString(),
                  ),
                  
                  buildContinerUnitAndLevelCourseCustomizCourseAuto(
                    context: context,
                    backGroundColor: const Color(0xFFeefdf5),
                    icon: Icons.star,
                    colorIcon: Colors.green,
                    label: 'مستوى صعوبة',
                    value: optionModel == null
                        ? '0'
                        : '${((optionModel!.averageDifficulty / 5) * 100).toStringAsFixed(2)}%',
                  ),
                ],
              ),
            ),
    
    
            getHeight(20),
            Padding(
             padding: PaddingApp.hor15,
              child: Wrap(
                children: List.generate(
                    optionModel == null ? 3 : optionModel!.courseCount, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildContinerCourseCustomizCourseAuto(
                      code: optionModel == null ? 'CSxxx' : optionModel!.courses[index].code,
                      unit: optionModel == null ? 0 : int.parse(optionModel!.courses[index].unit),
                      nameCourse:  optionModel == null ? 'CSxxx' : optionModel!.courses[index].name,
                      number: index+1,
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget builUpperBarCardCourseCustomizCourseAuto(
      {required String label,
      required int countCourse,
      required int optionNumber}) {
    return Row(
      children: [
        CustomCircleIcon(
          backGroundColor: const Color(0xFFe7e9fe),
          widget: Center(
            child: Text(
              optionNumber.toString(),
              style: TextStyleApp.font8Blue,
            ),
          ),
        ),
        getWidth(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyleApp.font10Black
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              '$countCourse مواد',
              style: TextStyleApp.font8Grey,
            ),
          ],
        )
      ],
    );
  }

  Widget buildContinerUnitAndLevelCourseCustomizCourseAuto(
      {required String label,
      required BuildContext context,
      required IconData icon,
      required Color colorIcon,
      required Color backGroundColor,
      required String value}) {
    return Container(
      width: MediaQuery.of(context).size.width *.35,
      padding: PaddingApp.getHorVer(2, 15),
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: colorIcon,
                size: 18,
              ),
              getWidth(5),
              Text(
                label,
                style: TextStyleApp.font7Grey,
              ),
            ],
          ),
            getHeight(5),
              Text(
                value,
                style: TextStyleApp.font9Grey,
              )
            
          
        ],
      ),
    );
  }

  Widget buildContinerCourseCustomizCourseAuto(
      {required int number,
      required String nameCourse,
      required String code,
      required int unit}) {

    return Container(
      padding: PaddingApp.getHorVer(15, 10),
      decoration: BoxDecoration(
          color: const Color(0xFFf9fafb),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '$number#',
                    style: TextStyleApp.font7Grey,
                  ),
                  getWidth(5),
                  Text(
                    nameCourse,
                    style: TextStyleApp.font7Black
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
              CustomCircleIcon(
                size: 35,
                backGroundColor: const Color(0xFFdbeafe),
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.computer,
                      color: Colors.blue,
                      size: 14,
                    ),
                    getWidth(3),
                    Text(
                      unit.toString(),
                      style: TextStyleApp.font7Blue,
                    )
                  ],
                ),
              ),
            ],
          ),
          getHeight(20),
          Text(
            code,
            style: TextStyleApp.font10Grey,
          ),
        ],
      ),
    );
  }
}
