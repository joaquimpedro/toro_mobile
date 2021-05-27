import 'package:flutter/material.dart';
import 'package:toro_mobile/views/trader_page.dart';

import 'views/trends_page.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      routes: {
        '/' : (context) => TrendsPage(),
        '/trader' : (context) => TraderPage(),
      },
    );
  }
}
