import 'package:bossapp/Config/Constant.dart';
import 'package:bossapp/Models/LanguageModel.dart';
import 'package:bossapp/common/SpHelper.dart';
import 'package:bossapp/config/Resources.dart';
import 'package:bossapp/core/ApplicationBloc.dart';
import 'package:bossapp/core/BlocProvider.dart';
import 'package:bossapp/screens/Main.dart';
import 'package:bossapp/splash/SSplashPage.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class TSplashPage extends StatefulWidget {
  @override
  _TSplashPageState createState() => _TSplashPageState();
}

class _TSplashPageState extends State<TSplashPage> {
  Locale _locale;
  Color _themeColor = ColorT.boss_them;

  @override
  void initState() {
    _initAsync();
    _initListener();
    super.initState();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      _loadLocale();
    });
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _loadLocale();
  }

  void _loadLocale() {
    setState(() {
      LanguageModel model = SpHelper.getLanguageModel();
      if (model != null) {
        LogUtil.e('LanguageModel: ' + model.toString());
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = null;
      }

      String _colorKey = SpUtil.getString(Constant.KEY_THEME_COLOR);
      if (ObjectUtil.isEmpty(_colorKey)) {
        _colorKey = 'bossDefalut';
      }
      _themeColor = themeColorMap[_colorKey];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/MainPage': (ctx) => Main(),
      },
      home: new SSplashPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: _themeColor,
        accentColor: _themeColor,
        indicatorColor: Colors.white,
      ),
      locale: _locale,
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   CustomLocalizations.delegate
      // ],
      // supportedLocales: CustomLocalizations.supportedLocales,
    );
  }
}
