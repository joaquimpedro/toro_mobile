import 'package:flutter/material.dart';
import 'package:toro_mobile/components/order_stock_dialog.dart';
import 'package:toro_mobile/models/stock.dart';

class TrendStockTile extends StatelessWidget {

  final Stock stock;

  TrendStockTile(this.stock);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.apartment),),
      title: Text(stock.symbol),
      subtitle: Text(stock.currentPrice.toStringAsFixed(2)),
      trailing: IconButton(
        icon: Icon(Icons.attach_money),
        onPressed: () async {
          var response = await _showOrderDialog(context, stock);
          if(response != null) {
            Navigator.of(context).pushNamed('/trader');
            showNotification(context, response.keys.first, response.values.first);
          }
        },
        tooltip: 'Comprar',
      ),

    );
  }

  Future _showOrderDialog(BuildContext context, Stock stock) async {

    return await showDialog(
        context: context,
        builder: (context) {
          return OrderStockDialog(stock);
        }
    );
  }

  void showNotification(BuildContext context, bool success, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(message,
            textAlign: TextAlign.center,
          ),
          backgroundColor: success ? Colors.green : Colors.red,
        )
    );
  }

}
