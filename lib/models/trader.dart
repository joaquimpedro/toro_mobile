import 'package:toro_mobile/models/financial_assets.dart';

class Trader {
  late String name;
  late double accountAmmount;
  late List<FinancialAsset> financialAssets;

  Trader({required this.name, required this.accountAmmount, required this.financialAssets});

  Trader.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountAmmount = json['accountAmmount'];

    if (json['financialAssets'] != null) {
      financialAssets = <FinancialAsset>[];
      json['financialAssets'].forEach((v) {
        financialAssets.add(new FinancialAsset.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['accountAmmount'] = this.accountAmmount;
    if (this.financialAssets != null) {
      data['financialAssets'] =
          this.financialAssets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}