import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/view/auth/loading_bloc/button_signup_bloc_consumer.dart';
import 'package:smart_assistant_app/view/auth/widget/from_widget_signup.dart';
import 'package:smart_assistant_app/view/auth/widget/texts_widget_auth.dart';
import 'package:smart_assistant_app/view/auth/widget/upper_bar_auth.dart';
import 'package:smart_assistant_app/view/auth/widget/widget_no_account_login.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/theme/box_decoration_app.dart';
import '../../../core/theme/colors_app.dart';
import '../../../core/theme/padding_app.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child:  Scaffold(
        backgroundColor: ColorsApp.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              getHeight(10),
              const UpperBarLogin( image: Assets.assetsImagesLogoNoBackgroundpng,),
              Padding(
                padding: PaddingApp.getOnlyPadding(0, 20, 20, 5),
                child: Container(
                  height: media.height * .6,
                  decoration: BoxDecorationApp.whiteRaduis25,
                  child: Padding(
                    padding: PaddingApp.hor15,
                    child: Column(
                      children: [
                       const TextsWidgetAuth(text : 'إنشاء حسابك في تطبيق عونا', subTitle : 'ادخل بياناتك كاملة'),
                        getHeight(20),
                       const  FromWidgetSignup(),
                       getHeight(10),
                       const ButtonSignupBlocConsumer(),
                       getHeight(20),
                       const WidgetNoAccountLogin(title: 'تمتلك حسابا؟ ', subTitle: 'سجل دخولك الآن'),
                      
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
