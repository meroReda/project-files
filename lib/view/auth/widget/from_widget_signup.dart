import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/view_model/auth/bloc_signup/signup_cubit.dart';

import '../../../core/helpers/size_box_responsive.dart';
import '../../../core/helpers/valid_function_app.dart';
import '../../../core/theme/colors_app.dart';
import '../../../core/theme/outline_border_app.dart';
import '../../../core/theme/text_style_app.dart';
import '../../../core/widget_app/text_filed_app.dart';

class FromWidgetSignup extends StatelessWidget {
  const FromWidgetSignup({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final cubitSignUp = context.read<SignupCubit>();
    return Form(
        key: cubitSignUp.formKey,
        child: Column(
          children: [
            CustomTextFiledFormLoginSignUp(
              icon: Icons.person,
              controller: cubitSignUp.fullNameController,
              label: 'ادخال الآسم كامل',
              validator: (value) {
                String error = ValidFunctionApp.validateName(value!);
                return error.isEmpty ? null : error;
              },
            ),
            TextFiledApp(
              validator: (value) {
                String error = ValidFunctionApp.validateEmail(value!);
                return error.isEmpty ? null : error;
              },
              controller: cubitSignUp.emailController,
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
                // التحقق من الفراغ
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال سنة الالتحاق';
                }

                // التحقق من أن القيمة رقمية
                int? valueYear = int.tryParse(value);
                if (valueYear == null) {
                  return 'يرجى إدخال سنة صحيحة (أرقام فقط)';
                }

                // التحقق من نطاق السنة
                if (valueYear < 2000 || valueYear >= 3000) {
                  return 'سنة الالتحاق يجب أن تكون بين 2000 و 2999';
                }

                // إذا كان كل شيء صحيح
                return null;
              },
              controller: cubitSignUp.yearController,
              width: media.width * .75,
              height: media.height * .08,
              textInputType: TextInputType.number,
              label: 'سنة الالتحاق',
              textStyleLabel: TextStyleApp.font9Grey,
              outlineInputBorder: whiteBorderRaduis25.copyWith(
                borderSide:
                    BorderSide(color: ColorsApp.primaryColor, width: 0.4),
              ),
              textStyle:
                  TextStyleApp.font9Black.copyWith(fontWeight: FontWeight.w500),
              fillColor: const Color.fromARGB(255, 255, 252, 252),
              prefixIcon: Icon(
                Icons.date_range,
                color: ColorsApp.primaryColor,
                size: 18,
              ),
            ),
            getHeight(20),
            TextFiledApp(
              validator: (value) {
                String error = ValidFunctionApp.validatePassword(value!);
                return error.isEmpty ? null : error;
              },
              controller: cubitSignUp.passwordController,
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
            ),
          ],
        ));
  }
}

class CustomTextFiledFormLoginSignUp extends StatelessWidget {
  const CustomTextFiledFormLoginSignUp({
    super.key,
    required this.controller,
    required this.icon,
    this.validator,
    required this.label,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final bool? isPassword;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return TextFiledApp(
      validator: validator,
      controller: controller,
      width: media.width * .75,
      height: media.height * .08,
      label: label,
      isPassword: isPassword,
      textStyleLabel: TextStyleApp.font9Grey,
      textStyle: TextStyleApp.font9Black.copyWith(fontWeight: FontWeight.w500),
      outlineInputBorder: whiteBorderRaduis25.copyWith(
        borderSide: BorderSide(color: ColorsApp.primaryColor, width: 0.4),
      ),
      fillColor: const Color.fromARGB(255, 255, 252, 252),
      prefixIcon: Icon(
        icon,
        color: ColorsApp.primaryColor,
        size: 18,
      ),
    );
  }
}
