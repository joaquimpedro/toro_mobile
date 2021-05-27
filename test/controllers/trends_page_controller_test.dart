import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:toro_mobile/commons/page_state.dart';
import 'package:toro_mobile/controllers/trends_page_controller.dart';
import 'package:toro_mobile/models/stock.dart';
import 'package:toro_mobile/repositories/stock_repository.dart';

import 'trends_page_controller_test.mocks.dart';

@GenerateMocks([StockRepository])
main() {

  final injector = Injector();
  final repository = MockStockRepository();
  final controller = TrendsPageController();

  setUpAll(() {
    injector.map<StockRepository>((injector) => repository);
  });

  group('fetchTrends', () {

    test('deve carregar as trends e setar estado de sucesso', () async {
      var stocks = [Stock(symbol: 'a', currentPrice: 10.0), Stock(symbol: 'b', currentPrice: 20.0)];
      when(repository.fetchTrends()).thenAnswer((_) async => stocks);

      await controller.start();
      expect(controller.stocks.isNotEmpty, true);
      expect(controller.stocks, stocks);
      expect(controller.state.value, PageState.success);
    });

    test('deve dar erro e setar o estado de erro', () async {
      when(repository.fetchTrends()).thenThrow((_) async => DioError( error: SocketException('api fora do ar'),requestOptions: new RequestOptions(path: '')));

      await controller.start();
      expect(controller.state.value, PageState.error);
    });

  });


}
