import 'package:flutter/material.dart';


class HaiTaoMain extends StatefulWidget {
  @override
  _HaiTaoMainState createState() => _HaiTaoMainState();
}

class _HaiTaoMainState extends State<HaiTaoMain> {
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