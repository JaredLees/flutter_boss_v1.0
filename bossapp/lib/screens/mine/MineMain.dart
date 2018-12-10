import 'package:bossapp/Config/Constant.dart';
import 'package:flutter/material.dart';


class MineMain extends StatefulWidget {
  @override
  _MineMainState createState() => _MineMainState();
}

class _MineMainState extends State<MineMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: Constant.appBarHeight,
            
          )
        ],
      )
    );
  }
}