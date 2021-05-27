import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:toro_mobile/models/trader.dart';


class TraderRepository {

  static const String TRADER = '/trader/1';

  final injector = Injector();
  Dio get dio => injector.get<Dio>();


  Future<Trader> fetchTrader() async {
    var response = await dio.get(TRADER);
    var result = response.data as Map<String, dynamic>;
    return Trader.fromJson(result);
  }

 }