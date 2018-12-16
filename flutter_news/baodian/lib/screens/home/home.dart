import 'package:flutter/material.dart';

import '../../components/bottom_navigation.dart';
import '../../core/bloc/bloc_provider.dart';
import 'home_bloc.dart';

class Home extends StatelessWidget {
  static Widget create() {
    return BlocProvider<HomeBloc>(
      bloc: HomeBloc(),
      child: Home(),
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);

    return new Scaffold(
      body: new Container(
        color: Colors.white,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[new Expanded(child: _getContent(bloc))],
        ),
      ),
      bottomNavigationBar: new BottomNavigation((index) {
        bloc.selectTab(index);
      }),
    );
  }

  Widget _getContent(HomeBloc bloc) {
    return StreamBuilder(
        stream: bloc.widgetSelected,
        initialData: Container(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.data;
        });
  }
}
