import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toro_mobile/commons/page_state.dart';

class TrendsPageController {

  final state = ValueNotifier<PageState>(PageState.start);

  Future start() async {
    //TODO fazer o load, atualizar a tela e o state.
    state.value = PageState.success;
  }

}