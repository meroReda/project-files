import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_state.dart';
import '../../../../view_model/customize_courses_of_semester/course_selection_mode.dart';
import '../../widget/choose_allocate_courses/container_choose_allocate_course.dart';

class ContainerChooseAllocateCourseBlocBuilder extends StatelessWidget {
  const ContainerChooseAllocateCourseBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomizeCoursesCubit, CustomizeCoursesState>(
        builder: (context, state) {
      final cubit = context.read<CustomizeCoursesCubit>();

      // بناء قائمة جديدة مع تحديث حالة isSelected بناءً على state.status
      final updatedModes = courseSelectionModes.asMap().entries.map((entry) {
        int idx = entry.key;
        CourseSelectionMode mode = entry.value;

        bool isSelected = (idx == 0 && state.status == CustomizeCoursesStatus.systemSelect) ||
                          (idx == 1 && state.status == CustomizeCoursesStatus.customSelect);

        return CourseSelectionMode(
          backgroundColor: mode.backgroundColor,
          colorIcon: mode.colorIcon,
          icon: mode.icon,
          title: mode.title,
          subtitle: mode.subtitle,
          options: mode.options,
          isSelected: isSelected,
        );
      }).toList();

      return Column(
        children: List.generate(updatedModes.length, (index) {
          return Padding(
            padding: PaddingApp.getOnlyPadding(0, 0, 0, 20),
            child: GestureDetector(
              onTap: () {
                cubit.changeSelect(index);
              },
              child: ContainerChooseAllocateCourse(
                  courseSelectionMode: updatedModes[index]),
            ),
          );
        }),
      );
    });
  }
}