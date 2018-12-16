import 'package:flutter/material.dart';

import 'core/Injection/Injector.dart';
import 'screens/home/home.dart';

void main() => runApp(BaoDian());

class BaoDian extends StatelessWidget {
  BaoDian(){
    Injector.configure(Flavor.PRO);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B_D',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        accentColor: Colors.red,
        brightness: Brightness.light
      ),
      home: Home.create(),
    );
  }
}
