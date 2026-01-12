// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/box_decoration_app.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_state.dart';


class ContainerClassFilter extends StatelessWidget {
  const ContainerClassFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final cubit = context.read<CompletedCoursesCubit>();
    return Container(
      height: media.height * .18,
      width: double.infinity,
      decoration: BoxDecorationApp.whiteRaduis8BorderAllWidth03ColorGrey,
      child: Padding(
        padding: PaddingApp.getHorVer(10, 5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'فلترة حسب الفصل الدراسي',
                style: TextStyleApp.font9Black
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            getHeight(5),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: BlocBuilder<CompletedCoursesCubit, CompletedCoursesState>(
                  builder: (context, state) {
                    return Wrap(
                      runSpacing: 6.0,
                      spacing: 20.0,
                      children: List.generate(
                          cubit.listAllSeason.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            cubit.changeSeason(index);
                          },
                          child: Container(
                            height: media.height * .04,
                            decoration: BoxDecoration(
                              color: state.selectedSeasonIndex == index
                                  ? Colors.blue
                                  : ColorsApp.bgScafoldGrey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: media.width * .2,
                            child: Center(
                              child: Text(
                                cubit.listAllSeason[index],
                                style: state.selectedSeasonIndex == index
                                    ? TextStyleApp.font7White
                                    : TextStyleApp.font7Black,
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
