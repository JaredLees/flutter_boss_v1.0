import 'dart:convert';
import 'package:bossapp/Config/Constant.dart';
import 'package:bossapp/Models/SplashModel.dart';
import 'package:bossapp/common/SpHelper.dart';
import 'package:bossapp/compoments/Swiper/Swiper.dart';
import 'package:bossapp/config/Resources.dart';
import 'package:bossapp/utils/HttpUtil.dart';
import 'package:bossapp/utils/ImageUitl.dart';
import 'package:bossapp/utils/NavigatorUtil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SSplashPage extends StatefulWidget {
  @override
  _SSplashPageState createState() => _SSplashPageState();
}

class _SSplashPageState extends State<SSplashPage> {
  TimerUtil _timerUtil;

  List<String> _guideList = [
    ImageUitl.getImgPath('splash_1'),
    ImageUitl.getImgPath('splash_2'),
    ImageUitl.getImgPath('splash_3'),
    //ImageUitl.getImgPath('guide4'),
  ];
  ///存放引导图
  List<Widget> _bannerList = new List();
  ///判别引导页 广告页
  int _status = 0;
  ///倒计时
  int _count = 3;

  ///广告
  SplashModel _splashModel;

  @override
  void initState() {
    _loadSplashData();
    _initAsync();
    super.initState();
  }

  void _loadSplashData() async {
    HttpUtil httpUtil = new HttpUtil();
    httpUtil.getSplash().then((model) async {
      await SpUtil.getInstance();
      _splashModel = SpHelper.getSplashModel();
      if (!ObjectUtil.isEmpty(model.imgUrl)) {
        if (_splashModel == null || (_splashModel.imgUrl != model.imgUrl)) {
          SpUtil.putString(Constant.KEY_SPLASH_MODEL, json.encode(model));
          setState(() {
            _splashModel = model;
          });
        }
      } else {
        SpUtil.putString(Constant.KEY_SPLASH_MODEL, '');
      }
    });
  }

  void _initAsync() {
    Observable.just(1).delay(new Duration(milliseconds: 1000)).listen((_) {
      //如过是第一次程序启动，且引导图不为空，则初始化引导图
      if (SpUtil.getBool(Constant.KEY_GUIDE) != true &&
          ObjectUtil.isNotEmpty(_guideList)) {
        SpUtil.putBool(Constant.KEY_GUIDE, true);
        _initBanner();
      } else {
        //其余启动加载广告页
        _initSplash();
      }
    });
  }
  /// banner 即是引导图 _status = 2;
  void _initBanner() {
    _initBannerData();
    setState(() {
      _status = 2;
    });
  }

  void _initBannerData() {
    for (int i = 0, length = _guideList.length; i < length; i++) {
      //最后一张添加进入按钮
      if (i == length - 1) {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _guideList[i],
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                margin: EdgeInsets.only(bottom: 100.0),
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green[800],
                  child: Text(
                    '开启时空',
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {
                    _goMain();
                  },
                ),
              ),
            ),
          ],
        ));
      } else {
        _bannerList.add(new Image.asset(
          _guideList[i],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ));
      }
    }
  }

  void _initSplash() {
    _splashModel = SpHelper.getSplashModel();
    if (_splashModel == null) {
      _goMain();
    } else {
      _doCountDown();
    }
  }

  /// 倒计时
  void _doCountDown() {
    setState(() {
      _status = 1;
    });
    _timerUtil = new TimerUtil(mTotalTime: 3 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0) {
        _goMain();
      }
    });
    _timerUtil.startCountDown();
  }

  void _goMain() {
    Navigator.of(context).pushReplacementNamed('/MainPage');
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null) _timerUtil.cancel(); //记得中dispose里面把timer cancel。
  }

  Widget _buildSplashBg() {
    return new Image.asset(
      ImageUitl.getImgPath('splash_bg'),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  ///跳转广告页
  Widget _buildAdWidget() {
    if (_splashModel == null) {
      return new Container(
        height: 0.0,
      );
    }
    return new Offstage(
      offstage: !(_status == 1),
      child: new InkWell(
        onTap: () {
          if (ObjectUtil.isEmpty(_splashModel.url)) return;
          _goMain();
          NavigatorUtil.pushWeb(context,
              title: _splashModel.title, url: _splashModel.url);
        },
        child: new Container(
          alignment: Alignment.center,
          child: new CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            imageUrl: _splashModel.imgUrl,
            placeholder: _buildSplashBg(),
            errorWidget: _buildSplashBg(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          new Offstage(
            offstage: !(_status == 0),
            child: _buildSplashBg(),
          ),
          new Offstage(
            offstage: !(_status == 2),
            child: ObjectUtil.isEmpty(_bannerList)
                ? new Container()
                : new Swiper(
                    autoStart: false,
                    circular: false,
                    indicator: CircleSwiperIndicator(
                      radius: 4.0,
                      padding: EdgeInsets.only(bottom: 30.0),
                      itemColor: Colors.black26,
                    ),
                    children: _bannerList),
          ),
          _buildAdWidget(),
          new Offstage(
            offstage: !(_status == 1),
            child: new Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  _goMain();
                },
                child: new Container(
                    padding: EdgeInsets.all(12.0),
                    child: new Text(
                      '跳过 $_count',
                      style: new TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    decoration: new BoxDecoration(
                        color: Color(0x66000000),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        border: new Border.all(
                            width: 0.33, color: ColorT.divider))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
