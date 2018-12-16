import 'package:baodian/components/ErroConection.dart';
import 'package:baodian/components/pageTransform/intro_page_item.dart';
import 'package:baodian/components/pageTransform/page_transformer.dart';
import 'package:baodian/core/bloc/bloc_provider.dart';
import 'package:baodian/models/notice.dart';
import 'package:baodian/screens/redpackwall/detail/detail_page.dart';
import 'package:baodian/screens/redpackwall/rpw_bloc.dart';
import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:sy_flutter_widgets/sy_flutter_widgets.dart';

class RedPackWall extends StatefulWidget {
  // @override
  // _RedPackWallState createState() => _RedPackWallState();
  final state = _RedPackWallState();
  @override
  State<StatefulWidget> createState() => state;
  static Widget create() {
    return BlocProvider<RpwBloc>(
      bloc: RpwBloc(),
      child: RedPackWall(),
    );
  }
}

class _RedPackWallState extends State<RedPackWall>
    with TickerProviderStateMixin {
  AnimationController animationController;
  RpwBloc bloc;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 350));
  }

  @override
  Widget build(BuildContext context) {
    if (bloc == null) {
      bloc = BlocProvider.of<RpwBloc>(context);
      //配置监听
      confBlocView(bloc);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('红包墙'),
        centerTitle: true,
      ),
      body: Container(
        //padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '公告：',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                            Container(
                              width: 300,
                              child: MarqueeWidget(
                                text:
                                    "新品发布，即将开始",
                                textStyle: new TextStyle(fontSize: 16.0),
                                scrollAxis: Axis.horizontal,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                  child: Stack(
                children: <Widget>[
                  GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        FadeTransition(
                          opacity: animationController,
                          child: _buildRpw(bloc),
                        ),
                        _getProgress(bloc)
                      ],
                    ),
                    onTap: () {
                      bloc.clickShowDetail();
                    },
                  ),
                  _proGressError()
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  /// 监视进程
  Widget _getProgress(RpwBloc bloc) {
    return StreamBuilder(
        initialData: false,
        stream: bloc.progress,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data) {
            return new Container(
              child: new Center(
                child: new CircularProgressIndicator(),
              ),
            );
          } else {
            return new Container();
          }
        });
  }

  ///监视错误
  _proGressError() {
    return StreamBuilder(
        stream: bloc.error,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data) {
            return ErroConection(tryAgain: () {
              bloc.load();
            });
          } else {
            return Container();
          }
        });
  }

  ///镜面滚动
  _buildRpw(RpwBloc bloc) {
    return StreamBuilder(
      initialData: List<Notice>(),
      stream: bloc.noticies,
      builder: (BuildContext content, AsyncSnapshot snapshot) {
        var _destaque = snapshot.data;
        return PageTransformer(
          pageViewBuilder: (content, visibilityResolver) {
            return PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: _destaque.length,
              onPageChanged: (position) {
                bloc.noticeSelected(_destaque[position]);
              },
              itemBuilder: (context, index) {
                final item = IntroNews.fromNotice(_destaque[index]);
                final pageVisibility =
                    visibilityResolver.resolvePageVisibility(index);
                return IntroNewsItem(
                    item: item, pageVisibility: pageVisibility);
              },
            );
          },
        );
      },
    );
  }

  void confBlocView(RpwBloc bloc) {
    bloc.anim.listen((show) {
      if (show) {
        animationController.forward();
      }
    });

    bloc.detail.listen((notice) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return DetailPage();
      }));
    });

    bloc.load();
  }
}
