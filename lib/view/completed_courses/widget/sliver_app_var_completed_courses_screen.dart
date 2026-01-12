import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/theme/colors_app.dart';
import '../../../core/theme/text_style_app.dart';

class SliverAppVarCompletedCoursesScreen extends StatelessWidget {
  const SliverAppVarCompletedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: ColorsApp.primaryColor,
      centerTitle: true,
      toolbarHeight: 60,
      leading: Image.asset(Assets.assetsImagesLogoNoBackgroundpng),
      title: Text(
        'تحديد مواد المنجزة',
        style: TextStyleApp.font10White,
      ),
    );
  }
}
