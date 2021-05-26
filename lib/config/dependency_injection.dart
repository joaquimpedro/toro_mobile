import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:toro_mobile/controllers/trends_page_controller.dart';
import 'package:toro_mobile/repositories/stock_repository.dart';

class DependencyInjection {
  Injector initialise(Injector injector) {

    injector.map<StockRepository>((i) => StockRepository());
    injector.map<TrendsPageController>((i) => TrendsPageController(), isSingleton: true);

    return injector;
  }
}