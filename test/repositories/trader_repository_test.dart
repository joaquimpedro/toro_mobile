import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:toro_mobile/models/stock.dart';
import 'package:toro_mobile/models/trader.dart';
import 'package:toro_mobile/repositories/stock_repository.dart';
import 'package:toro_mobile/repositories/trader_repository.dart';

import 'stock_repository_test.mocks.dart';


@GenerateMocks([Dio])
main() {

  final injector = Injector();
  final repository = TraderRepository();
  final dio = MockDio();

  setUpAll(() {
    injector.map<Dio>((injector) => dio);
  });

  group('fetchTrader', () {
    test('deve trazer um trader', () async {
      var responseData = {
        "name": "João e Maria",
        "accountAmmount": 536.0799999999999,
        "financialAssets": [
          {
            "symbol": "TORO4",
            "amount": 4,
            "unitPrice": 115.98
          }
        ]
      };

      when(dio.get(any)).thenAnswer((_) async => Response(data: responseData, statusCode: 200, requestOptions: RequestOptions(path: '')));

      final trader = await repository.fetchTrader();
      expect(Trader.fromJson(responseData).name, trader.name);
      expect(Trader.fromJson(responseData).accountAmmount, trader.accountAmmount);
      expect(Trader.fromJson(responseData).financialAssets.length, trader.financialAssets.length);
    });
  });

}