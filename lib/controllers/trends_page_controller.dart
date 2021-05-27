import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:toro_mobile/commons/page_state.dart';
import 'package:toro_mobile/config/dependency_injection.dart';
import 'package:toro_mobile/models/stock.dart';
import 'package:toro_mobile/repositories/stock_repository.dart';

class TrendsPageController {

  final state = ValueNotifier<PageState>(PageState.start);
  final injector = Injector();
  List<Stock> stocks = [];

  StockRepository get repository => injector.get<StockRepository>();

  Future start() async {
    state.value = PageState.loading;
    try {
      stocks = await repository.fetchTrends();
      state.value = PageState.success;
    } catch (e) {
      state.value = PageState.error;
    }
  }

}