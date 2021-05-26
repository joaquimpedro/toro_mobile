import 'package:flutter/material.dart';

import 'views/trends_page.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      routes: {
        '/' : (context) => TrendsPage(),
      },
    );
  }
}
