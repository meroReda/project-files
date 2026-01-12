import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_assistant_app/core/helpers/dailog/show_dialog.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/view/home/widget/overall_progress_card.dart';
import '../../../view_model/home/home_cubit.dart';
import '../../../view_model/home/home_state.dart';

class CompletedOfCoursesBlocBuilder extends StatelessWidget {
  const CompletedOfCoursesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(builder: (context, state) {
        if (state.status == HomeStatus.loading || state.status == HomeStatus.noConnected) {
         return const  Skeletonizer( enabled: true, child: OverallProgressCard());
      } else if (state.status == HomeStatus.error) {
      } else if (state.status == HomeStatus.success) {
        return  OverallProgressCard(coursesUser: state.coursesUser,);
      }
      return const SizedBox.shrink();
    }, listener: (context, state) {
      if(state.status == HomeStatus.noConnected){
        DialogHelper.showMessage(context,'لا يوجد لديك إتصال بالإنترنت',Colors.black,TextStyleApp.font10White);
      }
      else if(state.status == HomeStatus.error){
        DialogHelper.errorMessage(context, state.error!);
      }
    },
    
    );
  }
}
