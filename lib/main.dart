import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:toro_mobile/app_widget.dart';
import 'package:toro_mobile/config/dependency_injection.dart';

void main() {
  DependencyInjection().initialise(Injector());

  runApp(AppWidget());
}
