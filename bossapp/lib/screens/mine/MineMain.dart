import 'package:flutter/material.dart';


class MineMain extends StatefulWidget {
  @override
  _MineMainState createState() => _MineMainState();
}

class _MineMainState extends State<MineMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}