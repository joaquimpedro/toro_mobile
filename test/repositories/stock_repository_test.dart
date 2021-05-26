import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:toro_mobile/models/stock.dart';
import 'package:toro_mobile/repositories/stock_repository.dart';

import 'stock_repository_test.mocks.dart';


@GenerateMocks([Dio])
main() {

  final injector = Injector();
  final repository = StockRepository();
  final dio = MockDio();

  setUpAll(() {
    injector.map<Dio>((injector) => dio);
  });

  group('fetchTrends', () {
    test('deve trazer uma lista de stocks', () async {
      var responseData = [{'symbol': 'a', 'currentPrice': 10.5}, {'symbol': 'b', 'currentPrice': 20.0}];

      when(dio.get(any)).thenAnswer((_) async => Response(data: responseData, statusCode: 200, requestOptions: RequestOptions(path: '')));

      final list = await repository.fetchTrends();
      expect(list.length, responseData.length);
    });
  });

  group('orderStock', () {
    test('deve dar sucesso', () async {
      var request = {'symbol': 'a', 'amount': 3};
      var stock = Stock(symbol: 'a', currentPrice: 10) ;
      var response = "sucesso";

      when(dio.post(any, data: request)).thenAnswer((_) async => Response(data: response, statusCode: HttpStatus.ok, requestOptions: RequestOptions(path: '')));

      Map<bool, String> result = await repository.orderStock(stock, 3);

      expect(true, result.keys.first);
      expect(response, result.values.first);
    });

    test('deve dar erro quando o ativo for inválido', () async {
      var request = {'symbol': 'a', 'amount': 3};
      var stock = Stock(symbol: 'a', currentPrice: 10) ;
      var response = Response(data: "ativo inválido", statusCode: HttpStatus.badRequest, requestOptions: RequestOptions(path: ''));

      when(dio.post(any, data: request)).thenThrow(
        DioError(
          requestOptions: response.requestOptions,
          response: response
        )
      );

      Map<bool, String> result = await repository.orderStock(stock, 3);

      expect(false, result.keys.first);
      expect(response.data, result.values.first);
    });

    test('deve dar erro quando o saldo for insuficiente', () async {
      var request = {'symbol': 'a', 'amount': 3};
      var stock = Stock(symbol: 'a', currentPrice: 10) ;
      var response = Response(data: "saldo insuficiente", statusCode: HttpStatus.badRequest, requestOptions: RequestOptions(path: ''));

      when(dio.post(any, data: request)).thenThrow(
        DioError(
          requestOptions: response.requestOptions,
          response: response
        )
      );

      Map<bool, String> result = await repository.orderStock(stock, 3);

      expect(false, result.keys.first);
      expect(response.data, result.values.first);
    });

    test('deve dar erro quando a api está fora', () async {
      var request = {'symbol': 'a', 'amount': 3};
      var stock = Stock(symbol: 'a', currentPrice: 10) ;

      when(dio.post(any, data: request)).thenThrow(
          DioError(
              requestOptions: RequestOptions(path: ''),
          )
      );

      Map<bool, String> result = await repository.orderStock(stock, 3);

      expect(false, result.keys.first);
      expect('Não foi possível acessar a Toro.', result.values.first);
    });
  });

}