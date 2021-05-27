import 'package:flutter/material.dart';
import 'package:toro_mobile/components/order_stock_dialog.dart';
import 'package:toro_mobile/models/financial_assets.dart';
import 'package:toro_mobile/models/stock.dart';
import 'package:toro_mobile/models/trader.dart';

class TraderStockTile extends StatelessWidget {

  final FinancialAsset financialAsset;

  TraderStockTile(this.financialAsset);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.apartment),),
      title: Text(financialAsset.symbol),
      subtitle: Row(
        children: [
          Text('Qtd: ${financialAsset.amount}'),
          SizedBox(width: 10,),
          Text('Vlr Unitário: R\$${financialAsset.unitPrice}')
        ],
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
