import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/model/user_model.dart';
import 'package:smart_assistant_app/view/home/widget/container_ai_chat.dart';
import 'package:smart_assistant_app/view/home/widget/container_student_welcome.dart';
import 'package:smart_assistant_app/view_model/home/home_cubit.dart';
import 'package:smart_assistant_app/view_model/home/home_state.dart';
import '../../../core/widget_app/drawer/app_drawer.dart';
import '../loading_and_bloc/completed_of_courses_bloc_builder.dart';
import '../widget/container_continue_student.dart';

class HomeScreen extends StatelessWidget {
  final UserModel userModel;
  const HomeScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    context.read<HomeCubit>().getAllCouresesForUserInCubit(userModel);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ColorsApp.bgHome,
        drawer: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return AppDrawer(userModel : userModel , courseRequest: state.coursesUser!.courseRequest , currentCourse: state.coursesUser!.currentCourse );
          },
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: PaddingApp.hor15,
                child: Column(
                  children: [
                    getHeight(20),
                    ContainerStudentWelcome(userModel: userModel),
                    getHeight(20),
                    ContainerAiChat(userModel: userModel),
                    getHeight(20),
                    const CompletedOfCoursesBlocBuilder(),
                    getHeight(20),
                    const ContainerContinueStudent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
