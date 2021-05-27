import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:toro_mobile/app_widget.dart';
import 'package:toro_mobile/config/dependency_injection.dart';
import 'package:toro_mobile/config/ss_certificate_http_overrides.dart';

void main() {
  HttpOverrides.global = new SSCertificateHttpOverrides();

  DependencyInjection().initialise(Injector());

  runApp(AppWidget());
}
