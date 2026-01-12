import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/dailog/show_dialog.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/view/auth/loading_bloc/button_login_loading.dart';
import 'package:smart_assistant_app/view/auth/widget/button_signup.dart';
import 'package:smart_assistant_app/view_model/auth/bloc_signup/signup_state.dart';
import '../../../core/router/router_views.dart';
import '../../../core/theme/text_style_app.dart';
import '../../../view_model/auth/bloc_signup/signup_cubit.dart';

class ButtonSignupBlocConsumer extends StatelessWidget {
  const ButtonSignupBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(builder: (context, state) {
      if (state.status == SignupStatus.loading) {
        return const ButtonLoginLoading();
      }
      return const ButtonSignup();
    }, listener: (context, state) {
      if (state.status == SignupStatus.noConnected) {
        DialogHelper.noConntected(context);
      }
      if (state.status == SignupStatus.error) {
        DialogHelper.showMessage(
            context, state.error!, Colors.red, TextStyleApp.font10White);
      } else if (state.status == SignupStatus.success) {
        context.pushAndRemoveUntil(RouterViews.securityQuestion,arguments: state.userModel);
      }
    });
  }
}
