import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('ar','')); // اللغة الافتراضية

  void changeLanguage(Locale locale) {
    emit(locale); 
  }

   bool isEnglish() {
    return state.languageCode == 'en'; 
  }

  bool isArabic() {
    return state.languageCode == 'ar'; 
  }
}