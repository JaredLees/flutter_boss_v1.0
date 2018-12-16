import 'package:bossapp/core/ApplicationBloc.dart';
import 'package:bossapp/core/BlocProvider.dart';
import 'package:bossapp/core/MainBloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import './splash/SplashPage.dart';
import './splash/TSplashPage.dart';

// void main() => runApp(MainPro());
// class MainPro extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Boss直聘',
//         theme: ThemeData(
//           primaryIconTheme: const IconThemeData(color: Colors.white),
//           brightness: Brightness.light,
//           primaryColor: new Color.fromARGB(255, 0, 215, 198),
//           accentColor: Colors.cyan[300],
//         ),
//         home: PullAndPushTest());
//   }
// }

Future<void> main() async {
  TargetPlatform platform = defaultTargetPlatform;
  if (platform != TargetPlatform.iOS) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(BlocProvider<ApplicationBloc>(
    bloc: ApplicationBloc(),
    child: BlocProvider(child: TSplashPage(), bloc: MainBloc()),
  ));
}
