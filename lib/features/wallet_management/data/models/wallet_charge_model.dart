class WalletChargeModel {
  WalletChargeModel(
      {this.success,
      this.message,
      this.datam,
      this.statusCode,
      this.timestamp});

  WalletChargeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    datam = json['datam'] != null ? new Datam.fromJson(json['datam']) : null;
    statusCode = json['statusCode'];
    timestamp = json['timestamp'];
  }
  bool? success;
  String? message;
  Datam? datam;
  int? statusCode;
  String? timestamp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (datam != null) {
      data['datam'] = datam!.toJson();
    }
    data['statusCode'] = statusCode;
    data['timestamp'] = timestamp;
    return data;
  }
}

class Datam {
  Datam({this.balance, this.transaction});

  Datam.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
  }
  double? balance;
  Transaction? transaction;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    return data;
  }
}

class Transaction {
  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    walletId = json['wallet_id'];
    transactionType = json['transaction_type'];
    amount = json['amount'];
    balanceBefore = json['balance_before'];
    balanceAfter = json['balance_after'];
    transactionReference = json['transaction_reference'];
    description = json['description'];
    relatedBookingId = '${json['related_booking_id']}';
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    relatedCommissionId = '${json['related_commission_id']}';
  }

  Transaction(
      {this.id,
      this.walletId,
      this.transactionType,
      this.amount,
      this.balanceBefore,
      this.balanceAfter,
      this.transactionReference,
      this.description,
      this.relatedBookingId,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.relatedCommissionId});
  int? id;
  int? walletId;
  String? transactionType;
  String? amount;
  String? balanceBefore;
  String? balanceAfter;
  String? transactionReference;
  String? description;
  String? relatedBookingId;
  String? status;
  String? updatedAt;
  String? createdAt;
  String? relatedCommissionId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['wallet_id'] = walletId;
    data['transaction_type'] = transactionType;
    data['amount'] = amount;
    data['balance_before'] = balanceBefore;
    data['balance_after'] = balanceAfter;
    data['transaction_reference'] = transactionReference;
    data['description'] = description;
    data['related_booking_id'] = relatedBookingId;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['related_commission_id'] = relatedCommissionId;
    return data;
  }
}
