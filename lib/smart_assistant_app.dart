import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_assistant_app/core/helpers/constant.dart';
import 'package:smart_assistant_app/core/helpers/lang_cubit.dart';
import 'package:smart_assistant_app/core/router/app_router.dart';
import 'package:smart_assistant_app/core/theme/theme.dart';
import 'package:smart_assistant_app/generated/l10n.dart';
import 'core/router/router_views.dart';

class SmartAssistantApp extends StatelessWidget {
  final AppRouter appRouter;
  const SmartAssistantApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(builder: (context, local) {
      return ScreenUtilInit(
        designSize: const Size(320 ,900),
        minTextAdapt: true,
        child: MaterialApp(
          locale: local,
          debugShowCheckedModeBanner: false,
          theme: themeData(),
          localizationsDelegates: localizationDelegates,
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: RouterViews.splash,
        ),
      );
    });
  }
}
