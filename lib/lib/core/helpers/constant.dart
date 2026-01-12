import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../generated/l10n.dart';
const List<LocalizationsDelegate> localizationDelegates = [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const List<Locale> supportedLocales = [
  Locale('en', ''),
  Locale('ar', ''),
];
