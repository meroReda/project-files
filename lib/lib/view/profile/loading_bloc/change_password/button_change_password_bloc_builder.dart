import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/dailog/show_dialog.dart';
import 'package:smart_assistant_app/core/widget_app/loading_button.dart';
import 'package:smart_assistant_app/view_model/profile/profile_cubit.dart';
import 'package:smart_assistant_app/view_model/profile/profile_state.dart';

import '../../../../core/helpers/size_box_responsive.dart';
import '../../../../core/theme/colors_app.dart';
import '../../../../core/theme/text_style_app.dart';
import '../../../../core/widget_app/button_app.dart';

class ButtonChangePasswordBlocBuilder extends StatelessWidget {
  const ButtonChangePasswordBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.status == ProfileStatus.loading) {
          return ButtonApp(
            colorButton: ColorsApp.primaryColor,
            childWidget: const LoadingButton(),
          );
        }
        return ButtonApp(
          onTap: () {
            context.read<ProfileCubit>().update();
          },
          colorButton: ColorsApp.primaryColor,
          childWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.save,
                color: Colors.white,
              ),
              getWidth(10),
              Text(
                'حفظ كلمة المرور الجديد',
                style: TextStyleApp.font12White,
              )
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state.status == ProfileStatus.error) {
          DialogHelper.showMessage(
              context, state.error!, Colors.red, TextStyleApp.font10White);
        } else if (state.status == ProfileStatus.success) {
          DialogHelper.showMessage(context, 'تم تحديث كلمة المرور بنجاح', Colors.green, TextStyleApp.font10White);
        }
      },
    );
  }
}
