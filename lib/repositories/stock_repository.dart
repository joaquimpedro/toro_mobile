import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:toro_mobile/config/dependency_injection.dart';
import 'package:toro_mobile/models/stock.dart';


class StockRepository {

  static const String BASE_URL = 'https://10.0.2.2:5001/api';
  static const String TRENDS = '/trends';
  static const String ORDER = '/order';

  final injector = Injector();
  Dio get dio => injector.get<Dio>();


  Future<List<Stock>> fetchTrends() async {
    var response = await dio.get(BASE_URL + TRENDS);
    var results = response.data as List;

    return results.map((json) => Stock.fromJson(json)).toList();
  }

  Future<Map<bool, String>> orderStock(Stock stock, int amount) async {
    try {
      var response = await dio.post(BASE_URL + ORDER,
        data: {
          'symbol': stock.symbol,
          'amount': amount
        }
      );

      return  {true: response.data};
    } on DioError catch(e) {

      if(e.response == null) {
        return {false: 'Não foi possível acessar a Toro.'};
      }

      if(e.response!.statusCode == HttpStatus.badRequest) {
        return  {false: e.response!.data};
      }

      return {false: e.message};
    }
  }

 }