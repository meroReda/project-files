import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/model/option_model.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/widget/customiz_courses_auto_of_semester/card_course_customiz_course_auto.dart';

import '../../../../view_model/customize_courses_of_semester/customize_courses_cubit.dart';

class ListViewCustomizCourseAutoOfSemester extends StatelessWidget {
  final List<OptionModel>? optionModel;
  final int? selectedOpt;
  const ListViewCustomizCourseAutoOfSemester(
      {super.key, this.optionModel, this.selectedOpt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: optionModel == null ? 2 : optionModel!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                context.read<CustomizeCoursesCubit>().changeSelectedOp(index);
              },
              child: CardCourseCustomizCourseAuto(
                optionNumber: index,
                selectedOpt: selectedOpt == index,
                optionModel: optionModel == null ? null : optionModel![index],
              ),
            );
          }),
    );
  }
}
