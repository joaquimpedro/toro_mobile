import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:toro_mobile/repositories/stock_repository.dart';

class DependencyInjection {
  Injector initialise(Injector injector) {

    injector.map<StockRepository>((i) => StockRepository());
    injector.map<Dio>((i) => Dio(BaseOptions(
      connectTimeout: 10000
    )));

    return injector;
  }
}