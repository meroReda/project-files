import 'package:flutter/material.dart';
import 'package:smart_assistant_app/core/helpers/size_box_responsive.dart';
import 'package:smart_assistant_app/core/theme/box_decoration_app.dart';
import 'package:smart_assistant_app/core/theme/colors_app.dart';
import 'package:smart_assistant_app/core/theme/padding_app.dart';
import 'package:smart_assistant_app/view/auth/loading_bloc/button_login_bloc_consumer.dart';
import 'package:smart_assistant_app/view/auth/widget/form_widget_login.dart';
import 'package:smart_assistant_app/view/auth/widget/texts_widget_auth.dart';
import 'package:smart_assistant_app/view/auth/widget/upper_bar_auth.dart';
import 'package:smart_assistant_app/view/auth/widget/widget_no_account_login.dart';

import '../../../core/assets/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.primaryColor,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  const UpperBarLogin( image: Assets.assetsImagesLogoNoBackgroundpng,),
                  Padding(
                    padding: PaddingApp.getOnlyPadding(0, 20, 20, 5),
                    child: Container(
                      height: media.height * .6,
                      decoration: BoxDecorationApp.whiteRaduis25.copyWith(border: Border.all(width: 1,color: Colors.grey)),
                      child: Padding(
                        padding: PaddingApp.hor15,
                        child: Column(
                          children: [
                            const TextsWidgetAuth(text :'مرحبا بعودتك !', subTitle : 'سجل دخولك الآن' ),
                            getHeight(20),
                            const FormWidgetLogin(),
                            getHeight(30),
                            const ButtonLoginBlocConsumer(),
                            getHeight(30),
                            const WidgetNoAccountLogin(title: 'ليس لديك حساب؟', subTitle: 'سجل هنا الآن',),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
