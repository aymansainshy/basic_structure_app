import 'package:flutter/material.dart';
import 'package:mumayaz/src/data/shared_preferences/preferences_util.dart';

import 'package:mumayaz/src/lang/app_localazation.dart';
import 'package:mumayaz/src/configuration/preferences_config.dart';

class LanguageRepository {
  static String translate(BuildContext context, String text) {
    return AppLocalization.of(context).translate(text);
  }

  static String getLanguage() {
    return PreferencesUtils.getString(Preferences.language);
  }
}
