import 'package:flutter/material.dart';

class CompanyMain extends StatefulWidget {
  @override
  _CompanyMainState createState() => _CompanyMainState();
}

class _CompanyMainState extends State<CompanyMain> {
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