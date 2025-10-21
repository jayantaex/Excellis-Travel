class WalletModel {
  double? availableBalance;

  WalletModel({this.availableBalance});

  WalletModel.fromJson(Map<String, dynamic> json) {
    availableBalance =
        double.tryParse(json['availableBalance'].toString()) ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['availableBalance'] = availableBalance;
    return data;
  }
}
