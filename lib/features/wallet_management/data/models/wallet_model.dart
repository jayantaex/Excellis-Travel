class WalletBalanceModel {
  WalletBalanceModel.fromJson(Map<String, dynamic> json) {
    balance = double.parse(json['balance'].toString());
    currency = json['currency'];
    status = json['status'];
    totalDebt = double.parse(json['totalDebits'].toString());
    totoalCredit = double.parse(json['totalCredits'].toString());
  }

  WalletBalanceModel(
      {this.balance,
      this.currency,
      this.status,
      this.totalDebt,
      this.totoalCredit});
  double? balance;
  double? totalDebt;
  double? totoalCredit;
  String? currency;
  String? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['currency'] = currency;
    data['status'] = status;
    data['totalDebt'] = totalDebt;
    data['totoalCredit'] = totoalCredit;
    return data;
  }
}
