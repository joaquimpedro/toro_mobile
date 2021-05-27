import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:toro_mobile/commons/page_state.dart';
import 'package:toro_mobile/controllers/trader_page_controller.dart';
import 'package:toro_mobile/models/trader.dart';
import 'package:toro_mobile/repositories/trader_repository.dart';

import 'trader_page_controller_test.mocks.dart';

@GenerateMocks([TraderRepository])
main() {

  final injector = Injector();
  final repository = MockTraderRepository();
  final controller = TraderPageController();

  setUpAll(() {
    injector.map<TraderRepository>((injector) => repository);
  });

  group('fetchTrader', () {

    test('deve carregar o trader e setar estado de sucesso', () async {
      var trader = Trader(name: 'joão', accountAmmount: 1000, financialAssets: []);
      when(repository.fetchTrader()).thenAnswer((_) async => trader);

      await controller.start();
      expect(controller.trader != null, true);
      expect(controller.trader!.name, trader.name);
      expect(controller.trader!.accountAmmount, trader.accountAmmount);
      expect(controller.state.value, PageState.success);
    });

    test('deve dar erro e setar o estado de erro', () async {
      when(repository.fetchTrader()).thenThrow((_) async => DioError( error: SocketException('api fora do ar'),requestOptions: new RequestOptions(path: '')));

      await controller.start();
      expect(controller.state.value, PageState.error);
    });

  });


}
