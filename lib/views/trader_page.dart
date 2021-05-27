import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toro_mobile/commons/page_state.dart';
import 'package:toro_mobile/components/side_menu.dart';
import 'package:toro_mobile/components/trader_stock_tile.dart';

import 'package:toro_mobile/controllers/trader_page_controller.dart';


class TraderPage extends StatefulWidget {

  @override
  _TraderPage createState() => _TraderPage();

}

class _TraderPage extends State<TraderPage> {

  final controller = TraderPageController();

  _success() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Saldo em conta: ${controller.trader!.accountAmmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold
                ),
              ),
              Text('Investido: ${controller.trader!.financialAssets.map((e) => e.amount * e.unitPrice).reduce((a, b) => a + b)}',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: ListView.builder(
              itemCount: controller.trader != null ? controller.trader!.financialAssets.length : 0,
              itemBuilder: (context, index) {
                return TraderStockTile(controller.trader!.financialAssets.elementAt(index));
              },
            ),
          ),
        ],
      ),
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
        title: Text('Minhas ações!'),
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
