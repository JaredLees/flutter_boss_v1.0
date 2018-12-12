import 'dart:convert';
import 'package:bossapp/Config/Constant.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';

import 'package:bossapp/Models/LanguageModel.dart';
import 'package:bossapp/Models/SplashModel.dart';


class SpHelper {
  static LanguageModel getLanguageModel() {
    String _saveLanguage = SpUtil.getString(Constant.keyLanguage);
    if (ObjectUtil.isNotEmpty(_saveLanguage)) {
      Map userMap = json.decode(_saveLanguage);
      return LanguageModel.fromJson(userMap);
    }
    return null;
  }

  static SplashModel getSplashModel() {
    String _splashModel = SpUtil.getString(Constant.KEY_SPLASH_MODEL);
    if (ObjectUtil.isNotEmpty(_splashModel)) {
      Map userMap = json.decode(_splashModel);
      return SplashModel.fromJson(userMap);
    }
    return null;
  }
}