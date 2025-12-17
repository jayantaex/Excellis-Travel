class PaymentOrderModel {
  PaymentOrderModel(
      {this.orderId,
      this.status,
      this.amountDue,
      this.amountPaid,
      this.currency});

  PaymentOrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    status = json['status'];
    amountDue = json['amount_due'];
    amountPaid = json['amount_paid'];
    currency = json['currency'];
  }
  String? orderId;
  String? status;
  String? amountDue;
  String? amountPaid;
  String? currency;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['status'] = status;
    data['amountDue'] = amountDue;
    data['amountPaid'] = amountPaid;
    data['currency'] = currency;
    return data;
  }
}
