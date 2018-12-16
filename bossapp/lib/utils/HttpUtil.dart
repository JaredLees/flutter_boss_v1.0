import 'package:bossapp/Models/SplashModel.dart';

class HttpUtil {
  //模拟网络请求数据
  Future<SplashModel> getSplash() {
    return Future.delayed(new Duration(milliseconds: 300), () {
      return new SplashModel(
        title: '广告Title',
        content: '广告页 content',
        url: 'https://www.wenjuan.com/s/zamIRb',
        imgUrl:
            'https://images.cnblogs.com/cnblogs_com/gdsblog/1129111/o_%e5%be%ae%e4%bf%a1%e5%85%ac%e4%bc%97%e5%8f%b71.png',
      );
    });
  }
}