import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view/customize_courses_of_semester/widget/customize_courses_of_semester/container_customize_courses_of_semester.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_cubit.dart';
import 'package:smart_assistant_app/view_model/customize_courses_of_semester/customize_courses_state.dart';

import '../loading_bloc/customize_courses_of_semester/sliver_appbar_customize_courses_of_semester_bloc_builder.dart';

class CustomizeCoursesOfSemesterScreen extends StatelessWidget {
  final UserModel userModel;
  const CustomizeCoursesOfSemesterScreen( {super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomizeCoursesCubit>();
    cubit.getAllCouresesForUserInCubit(userModel);
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFf3f5ff),
          body: CustomScrollView(
            slivers: [
              SliverAppbarCustomizeCoursesOfSemesterBlocBuilder(userModel: userModel,),
              SliverToBoxAdapter(
                child: Padding(
                  padding: PaddingApp.hor15,
                  child:
                    BlocBuilder<CustomizeCoursesCubit, CustomizeCoursesState>(
                    builder: (context, state) {
                      if (state.status == CustomizeCoursesStatus.succesGetCourese) {
                        return Column(
                          children: [
                            ...List.generate(state.coursesRequest!.length,
                                (index) {
                              return ContainerCustomizeCoursesOfSemester(
                                courseModel: state.coursesRequest![index],
                                index: index,
                              );
                            }),
                          ],
                        );
                      }
                      
                      return  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getHeight(50),
                          const CircularProgressIndicator(),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
