import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/extension.dart';
import 'package:smart_assistant_app/view/auth/loading_bloc/button_login_loading.dart';
import 'package:smart_assistant_app/view/auth/widget/row_button_login_and_forget_passoword.dart';
import '../../../core/helpers/dailog/show_dialog.dart';
import '../../../core/router/router_views.dart';
import '../../../view_model/auth/bloc_login/login_cubit.dart';
import '../../../view_model/auth/bloc_login/login_state.dart';

class ButtonLoginBlocConsumer extends StatelessWidget {
  const ButtonLoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state.status == LoginStatus.loading) {
          return const ButtonLoginLoading();
        }
        return const RowButtonLoginAndForgetPassoword();
       
      },
      listener: (context, state) {
        if (state.status == LoginStatus.noConnected) {
          DialogHelper.noConntected(context);
        }
        else if (state.status == LoginStatus.error) {
          DialogHelper.errorMessage(context, state.error!);
        } else if (state.status == LoginStatus.success) {
          
          context.pushAndRemoveUntil(RouterViews.home,arguments: state.userModel);
        }
      },
    );
  }
}
