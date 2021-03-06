// Mocks generated by Mockito 5.0.9 from annotations
// in toro_mobile/test/controllers/trader_page_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:dio/src/dio.dart' as _i3;
import 'package:flutter_simple_dependency_injection/src/injector.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:toro_mobile/models/trader.dart' as _i4;
import 'package:toro_mobile/repositories/trader_repository.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeInjector extends _i1.Fake implements _i2.Injector {}

class _FakeDio extends _i1.Fake implements _i3.Dio {}

class _FakeTrader extends _i1.Fake implements _i4.Trader {}

/// A class which mocks [TraderRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTraderRepository extends _i1.Mock implements _i5.TraderRepository {
  MockTraderRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Injector get injector => (super.noSuchMethod(Invocation.getter(#injector),
      returnValue: _FakeInjector()) as _i2.Injector);
  @override
  _i3.Dio get dio =>
      (super.noSuchMethod(Invocation.getter(#dio), returnValue: _FakeDio())
          as _i3.Dio);
  @override
  _i6.Future<_i4.Trader> fetchTrader() =>
      (super.noSuchMethod(Invocation.method(#fetchTrader, []),
              returnValue: Future<_i4.Trader>.value(_FakeTrader()))
          as _i6.Future<_i4.Trader>);
}
