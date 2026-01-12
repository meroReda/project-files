import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant_app/core/helpers/cubit_app/connect_cubit.dart';
import 'package:smart_assistant_app/core/helpers/lang_cubit.dart';
import 'package:smart_assistant_app/core/router/app_router.dart';
import 'package:smart_assistant_app/smart_assistant_app.dart';
import 'package:smart_assistant_app/view_model/home/home_cubit.dart';
import 'package:smart_assistant_app/view_model/syllabus/syllabus_cubit.dart';

void main() {
  
  runApp(

    MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit(ConnectivityCubit())),
          BlocProvider(create: (context) => LanguageCubit()),
          BlocProvider(create: (context) => ConnectivityCubit()),
          BlocProvider(create: (context) => SyllabusCubit())
        ],
        child: SmartAssistantApp(
          appRouter: AppRouter(),
        )),
  );
}
