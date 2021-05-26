import 'package:flutter/material.dart';
import 'package:toro_mobile/models/stock.dart';

class StockTile extends StatelessWidget {

  final Stock _stock;

  StockTile(this._stock);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.apartment),),
      title: Text(_stock.symbol),
      subtitle: Text(_stock.currentPrice.toStringAsFixed(2)),
      trailing: IconButton(
        icon: Icon(Icons.attach_money),
        onPressed: () {
        },
        tooltip: 'Comprar',
      ),
    );
  }
}
