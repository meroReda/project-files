import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/helpers/valid_function_app.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/text_style_app.dart';
import 'package:smart_assistant_app/view_model/auth/bloc_login/login_cubit.dart';

import '../../../core/theme/outline_border_app.dart';
import '../../../core/widget_app/text_filed_app.dart';

class FormWidgetLogin extends StatelessWidget {
  const FormWidgetLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final cubitLogin = context.read<LoginCubit>();
    return Form(
        key: cubitLogin.formKey,
        child: Column(
          children: [
            TextFiledApp(
              validator: (value){
                String error = ValidFunctionApp.validateEmail(value!);
                return error.isEmpty ? null : error;
              },
              controller: cubitLogin.emailController,
              width: media.width * .75,
              height: media.height * .08,
              label: 'البريد الإلكتروني',
              textStyleLabel: TextStyleApp.font9Grey,
              textStyle:
                  TextStyleApp.font9Black.copyWith(fontWeight: FontWeight.w500),
              outlineInputBorder: whiteBorderRaduis25.copyWith(
              borderSide:
                    BorderSide(color: ColorsApp.primaryColor, width: 0.4),
              ),
              fillColor: const Color.fromARGB(255, 255, 252, 252),
              prefixIcon: Icon(
                Icons.email,
                color: ColorsApp.primaryColor,
                size: 18,
              ),
            ),
            getHeight(10),
            TextFiledApp(
              validator: (value) {
                String error = ValidFunctionApp.validatePassword(value!);
                return error.isEmpty ? null : error;
              },
              controller: cubitLogin.passwordController,
              width: media.width * .75,
              height: media.height * .08,
              isPassword: true,
              label: 'كلمة المرور',
              textStyleLabel: TextStyleApp.font9Grey,
              outlineInputBorder: whiteBorderRaduis25.copyWith(
                  borderSide:
                      BorderSide(color: ColorsApp.primaryColor, width: 0.4)),
              textStyle:
                  TextStyleApp.font9Black.copyWith(fontWeight: FontWeight.w500),
              fillColor: const Color.fromARGB(255, 255, 252, 252),
              prefixIcon: Icon(
                Icons.lock,
                color: ColorsApp.primaryColor,
                size: 18,
              ),
            )
          ],
        ));
  }
}
