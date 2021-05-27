class FinancialAsset {
  String symbol;
  int amount;
  double unitPrice;

  FinancialAsset({required this.symbol, required this.amount, required this.unitPrice});

  FinancialAsset.fromJson(Map<String, dynamic> json) :
    symbol = json['symbol'],
    amount = json['amount'],
    unitPrice = json['unitPrice'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['amount'] = this.amount;
    data['unitPrice'] = this.unitPrice;
    return data;
  }
}