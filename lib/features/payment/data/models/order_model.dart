class OrderRespModel {
  OrderRespModel({this.orderId, this.amount});

  OrderRespModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    amount = json['amount'];
  }
  String? orderId;
  int? amount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['amount'] = amount;
    return data;
  }
}
