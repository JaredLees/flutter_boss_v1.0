import 'package:flutter/material.dart';
import './splash/SplashPage.dart';

void main() => runApp(MainPro());

class MainPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boss直聘',
        theme: ThemeData(
          primaryIconTheme: const IconThemeData(color: Colors.white),
          brightness: Brightness.light,
          primaryColor: new Color.fromARGB(255, 0, 215, 198),
          accentColor: Colors.cyan[300],
        ),
        home: SplashPage());
  }
}
