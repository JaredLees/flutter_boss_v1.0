import '../repository/repository.dart';

enum Flavor {
  MOCK,//mock 数据
  PRO//真是数据
}

/// Simple DI 依赖注入
class Injector {
  static final Injector _singleton = new Injector._();
  static Flavor _flavor;

  /// 程序启动注入配置 mock or pro
  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._();

  Repository get repository {
    switch(_flavor) {
      case Flavor.MOCK: return new Repository(false);
      default: // Flavor.PRO:
        return new Repository(true);
    }
  }
}