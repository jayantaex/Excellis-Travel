class WalletBalanceModel {
  WalletBalanceModel.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    currency = json['currency'];
    status = json['status'];
  }

  WalletBalanceModel({this.balance, this.currency, this.status});
  double? balance;
  String? currency;
  String? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['currency'] = currency;
    data['status'] = status;
    return data;
  }
}
