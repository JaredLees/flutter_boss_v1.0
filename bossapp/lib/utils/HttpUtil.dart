import 'package:bossapp/Models/SplashModel.dart';

class HttpUtil {
  //模拟网络请求数据
  Future<SplashModel> getSplash() {
    return Future.delayed(new Duration(milliseconds: 300), () {
      return new SplashModel(
        title: '广告Title',
        content: '广告页 content',
        url: 'http://www.cnblogs.com/gdsblog',
        imgUrl:
            'https://github.com/TopGuo/Flutter_MyApp/blob/master/doc/shothot/2.gif?raw=true',
      );
    });
  }
}