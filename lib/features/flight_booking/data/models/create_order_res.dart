class OrderModel {
  OrderModel(
      {this.amount,
      this.amountDue,
      this.amountPaid,
      this.attempts,
      this.createdAt,
      this.currency,
      this.entity,
      this.id,
      this.paymentId,
      this.notes,
      this.offerId,
      this.receipt,
      this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    amountDue = json['amount_due'];
    amountPaid = json['amount_paid'];
    attempts = json['attempts'];
    createdAt = json['created_at'];
    currency = json['currency'];
    entity = json['entity'];
    id = json['id'];
    notes = json['notes'] != null ? Notes.fromJson(json['notes']) : null;
    offerId = json['offer_id'];
    receipt = json['receipt'];
    status = json['status'];
    paymentId = int.parse(json['receipt'].split('_')[1]);
  }
  int? amount;
  int? amountDue;
  int? amountPaid;
  int? attempts;
  int? createdAt;
  String? currency;
  String? entity;
  String? id;
  int? paymentId;
  Notes? notes;
  String? offerId;
  String? receipt;
  String? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['amount_due'] = amountDue;
    data['amount_paid'] = amountPaid;
    data['attempts'] = attempts;
    data['created_at'] = createdAt;
    data['currency'] = currency;
    data['entity'] = entity;
    data['id'] = id;
    if (notes != null) {
      data['notes'] = notes!.toJson();
    }
    data['offer_id'] = offerId;
    data['receipt'] = receipt;
    data['status'] = status;
    return data;
  }
}

class Notes {
  Notes({this.bookingId, this.bookingReference});

  Notes.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingReference = json['booking_reference'];
  }
  String? bookingId;
  String? bookingReference;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_id'] = bookingId;
    data['booking_reference'] = bookingReference;
    return data;
  }
}
