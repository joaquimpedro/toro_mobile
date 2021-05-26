class Stock {
  String symbol;
  double currentPrice;

  Stock( {required this.symbol,  required this.currentPrice});

  Stock.fromJson(Map<String, dynamic> json) :
        symbol = json['symbol'],
        currentPrice = json['currentPrice'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['currentPrice'] = this.currentPrice;
    return data;
  }
}
