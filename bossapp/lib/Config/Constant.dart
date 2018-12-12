import 'dart:ui';

/// 常量配置类
class Constant {
  ///Tab文本字体大小
  static const double kTabTextSize = 11.0;
  static const int INDEX_JOB = 0;
  static const int INDEX_COMPANY = 1;
  static const int INDEX_MESSAGE = 2;
  static const int INDEX_MINE = 3;
  static Color kPrimaryColor = new Color.fromARGB(255, 0, 215, 198);

  ///导航高度
  static const double kTextAndIconTabHeight = 55.0;

  ///图标与文字的间隔
  static const double kMarginBottom = 3.0;

  ///tabBarImageSize
  static const double TabImageWidth = 30;

  ///TabImageHeight
  static const double TabImageHeight = 30;

  ///appBarHeight 高度
  static const double appBarHeight = 150.0;

  //static const enum AppBarBehavior { normal, pinned, floating, snapping }

  ///公司详情页appbar高度
  static const double ComDetailAppBarHeight = 256.0;

  static const String keyLanguage = 'key_language';
  static const String KEY_THEME_COLOR = 'key_theme_color';
  static const String KEY_GUIDE = 'key_guide';
  static const String KEY_SPLASH_MODEL = 'key_splash_model';

  static const int TYPE_SYS_UPDATE = 1;
}
