import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/bloc/bloc_provider.dart';
import '../haitao/haitao_main.dart';
import '../hot/hot_main.dart';
import '../mine/mine_main.dart';
import '../redpackwall/rpw_main.dart';

///HomeBloc
class HomeBloc extends BlocBase {
  StreamController<int> _tabPositionController = StreamController<int>();
  StreamController<Widget> _screenController = StreamController<Widget>();

  Function(int) get selectTab => _tabPositionController.sink.add;
  Stream<int> get tabPosition => _tabPositionController.stream;

  Function(Widget) get addWidget => _screenController.sink.add;
  Stream<Widget> get widgetSelected => _screenController.stream;

  HomeBloc(){
    selectTab(0);
    tabPosition.listen((position){
      switch(position){
        case 0: addWidget(RedPackWall.create());break;
        case 1: addWidget(HotMain());break;
        case 2: addWidget(HaiTaoMain());break;//pub+
        case 2: addWidget(HaiTaoMain());break;
        default: addWidget(MineMain());

      }

    });
  }

  @override
  void dispose() {
    _tabPositionController.close();
    _screenController.close();
  }
}
