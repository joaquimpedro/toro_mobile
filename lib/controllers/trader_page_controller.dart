import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:toro_mobile/commons/page_state.dart';
import 'package:toro_mobile/config/dependency_injection.dart';
import 'package:toro_mobile/models/stock.dart';
import 'package:toro_mobile/models/trader.dart';
import 'package:toro_mobile/repositories/stock_repository.dart';
import 'package:toro_mobile/repositories/trader_repository.dart';

class TraderPageController {

  final state = ValueNotifier<PageState>(PageState.start);
  final injector = Injector();
  Trader? trader;

  TraderRepository get repository => injector.get<TraderRepository>();

  Future start() async {
    state.value = PageState.loading;
    try {
      trader = await repository.fetchTrader();
      state.value = PageState.success;
    } catch (e) {
      state.value = PageState.error;
    }
  }

}