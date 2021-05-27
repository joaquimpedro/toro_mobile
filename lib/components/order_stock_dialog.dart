import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:toro_mobile/models/stock.dart';
import 'package:toro_mobile/repositories/stock_repository.dart';

class OrderStockDialog extends StatefulWidget {

  final Stock stock;

  OrderStockDialog(this.stock);

  @override
  _OrderStockDialogState createState() => _OrderStockDialogState();
}

class _OrderStockDialogState extends State<OrderStockDialog> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final injector = Injector();
  StockRepository get repository => injector.get<StockRepository>();

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.stock.symbol),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          NumberPicker(
            value: amount,
            minValue: 1,
            maxValue: 10,
            step: 1,
            onChanged: (value) {
              setState(() {
                amount = value;
              });
            },
          )
        ],
        ),
      ),
      actions: <Widget>[
        TextButton(onPressed: () async {
          if(formKey.currentState!.validate()) {
            var apiResponse = await repository.orderStock(widget.stock, amount);
            Navigator.pop(context, apiResponse);
          }
        }, child: Text('Confirmar'))
      ],
    );
  }
}
