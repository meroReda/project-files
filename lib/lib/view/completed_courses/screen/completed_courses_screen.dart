import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view/completed_courses/loading_bloc/button_completed_courses_bloc_builder.dart';
import 'package:smart_assistant_app/view/completed_courses/widget/container_class_filter.dart';
import 'package:smart_assistant_app/view_model/completed_courses/completed_courses_cubit.dart';
import '../loading_bloc/display_courses_bloc_builder.dart';
import '../loading_bloc/widget_display_texts_courses_complaeted_bloc_builder.dart';
import '../widget/sliver_app_var_completed_courses_screen.dart';
import '../widget/widget_upper_bar_completed_courses.dart';

class CompletedCoursesScreen extends StatelessWidget {
  final UserModel userModel;
  const CompletedCoursesScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    context.read<CompletedCoursesCubit>().beforeRepo();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.bgScafoldGrey,
        body: CustomScrollView(
          slivers: [
            const SliverAppVarCompletedCoursesScreen(),
            SliverToBoxAdapter(
                child: Padding(
              padding: PaddingApp.hor10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getHeight(20),
                  const WidgetUpperBarCompletedCourses(),
                  getHeight(20),
                  const ContainerClassFilter(),
                  getHeight(20),
                  const WidgetDisplayTextsCoursesComplaetedBlocBuilder(),
                  getHeight(20),
                  const DisplayCoursesBlocBuilder(),
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: ButtonCompletedCoursesBlocBuilder(userModel: userModel),
      ),
    );
  }
}
