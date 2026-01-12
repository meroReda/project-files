import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/core/widget_app/custom_app_bar.dart';
import 'package:smart_assistant_app/view_model/home/home_cubit.dart';

import '../../../../view_model/home/home_state.dart';

class AppBarChooseAllocateCourse extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarChooseAllocateCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return CustomAppBar(
        center: true,
        toolbarHeight: 60,
        title: state.coursesUser!.currentCourse.isEmpty ? 'نزل موادك الآن' : 'مواد خاصة بك',
        textStyle: TextStyleApp.font12White,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
