import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

const String LANGUAGE_CODE = 'languageCode';

const String ENGLISH = "en";
const String ARABIC = "ar";
const String MARATHI = 'mr';
const String HINDI = 'hi';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Future<String> getLocale() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  
  return await sharedPref.getString(LANGUAGE_CODE) ?? ENGLISH;
  
}

Locale _locale(String langugaeCode){
  switch(langugaeCode){
    case ENGLISH:
      return const Locale(ENGLISH);
    case MARATHI:
      return const Locale(MARATHI);
    case HINDI:
      return const Locale(HINDI);
    case ARABIC:
      return const Locale(ARABIC);
    default: 
      return const Locale(ENGLISH);
  }
}