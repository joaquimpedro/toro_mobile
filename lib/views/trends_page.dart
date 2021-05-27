import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toro_mobile/commons/page_state.dart';
import 'package:toro_mobile/components/side_menu.dart';
import 'package:toro_mobile/components/trends_stock_tile.dart';
import 'package:toro_mobile/controllers/trends_page_controller.dart';
import 'package:toro_mobile/models/stock.dart';

class TrendsPage extends StatefulWidget {

  @override
  _TrendsPageState createState() => _TrendsPageState();

}

class _TrendsPageState extends State<TrendsPage> {
  final controller = TrendsPageController();

  _success() {
    return ListView.builder(
      itemCount: controller.stocks.length,
      itemBuilder: (context, index) {
        return TrendStockTile(controller.stocks.elementAt(index > 4 ? 1 : index));
      },

    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        child: Text('Tentar novamente'),
        onPressed: () {
          controller.start();
        },
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(PageState state) {
    switch(state) {
      case PageState.start:
        return _start();
      case PageState.loading:
        return _loading();
      case PageState.error:
        return _error();
      case PageState.success:
        return _success();
      default:
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('As top 5 de hoje!'),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
