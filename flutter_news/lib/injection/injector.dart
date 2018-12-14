import 'package:FlutterNews/conection/repository.dart';

enum Flavor {
  MOCK,
  PRO
}

/// Simple DI
class Injector {
  static final Injector _singleton = new Injector._();
  static Flavor _flavor;

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