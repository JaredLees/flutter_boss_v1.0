import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/Main.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 1500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (BuildContext context) => Main()),
            (Route route) => route == null);
      } catch (e) {
        print('error_timer_$e');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color.fromARGB(255, 0, 215, 198),
        child: new Padding(
          padding: const EdgeInsets.only(
            top: 150.0,
          ),
          child: new Column(
            children: <Widget>[
              new Text(
                "BOSS直聘",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
