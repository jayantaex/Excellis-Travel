class OverDueDataModel {
  OverDueDataModel(
      {this.id,
      this.creditWalletId,
      this.recipientUserId,
      this.amount,
      this.repaymentDate,
      this.repaymentStatus,
      this.repaymentReminderSent,
      this.lastReminderSentAt,
      this.autoDeductionAttempted,
      this.autoDeductionDate,
      this.relatedWalletTransactionId,
      this.description,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.recipient,
      this.creditWallet});

  OverDueDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creditWalletId = json['credit_wallet_id'];
    recipientUserId = json['recipient_user_id'];
    amount = json['amount'];
    repaymentDate = json['repayment_date'];
    repaymentStatus = json['repayment_status'];
    repaymentReminderSent = json['repayment_reminder_sent'];
    lastReminderSentAt = json['last_reminder_sent_at'];
    autoDeductionAttempted = json['auto_deduction_attempted'];
    autoDeductionDate = json['auto_deduction_date'];
    relatedWalletTransactionId = json['related_wallet_transaction_id'];
    description = json['description'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    recipient = json['recipient'] != null
        ? Recipient.fromJson(json['recipient'])
        : null;
    creditWallet = json['creditWallet'] != null
        ? CreditWallet.fromJson(json['creditWallet'])
        : null;
  }
  int? id;
  int? creditWalletId;
  int? recipientUserId;
  String? amount;
  String? repaymentDate;
  String? repaymentStatus;
  bool? repaymentReminderSent;
  String? lastReminderSentAt;
  bool? autoDeductionAttempted;
  String? autoDeductionDate;
  int? relatedWalletTransactionId;
  String? description;
  Metadata? metadata;
  String? createdAt;
  String? updatedAt;
  Recipient? recipient;
  CreditWallet? creditWallet;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['credit_wallet_id'] = creditWalletId;
    data['recipient_user_id'] = recipientUserId;
    data['amount'] = amount;
    data['repayment_date'] = repaymentDate;
    data['repayment_status'] = repaymentStatus;
    data['repayment_reminder_sent'] = repaymentReminderSent;
    data['last_reminder_sent_at'] = lastReminderSentAt;
    data['auto_deduction_attempted'] = autoDeductionAttempted;
    data['auto_deduction_date'] = autoDeductionDate;
    data['related_wallet_transaction_id'] = relatedWalletTransactionId;
    data['description'] = description;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (recipient != null) {
      data['recipient'] = recipient!.toJson();
    }
    if (creditWallet != null) {
      data['creditWallet'] = creditWallet!.toJson();
    }
    return data;
  }
}

class Metadata {
  Metadata(
      {this.userCode, this.refundDays, this.giverUserId, this.unlimitedCredit});

  Metadata.fromJson(Map<String, dynamic> json) {
    userCode = json['userCode'];
    refundDays = json['refundDays'];
    giverUserId = json['giver_user_id'];
    unlimitedCredit = json['unlimited_credit'];
  }
  String? userCode;
  int? refundDays;
  int? giverUserId;
  bool? unlimitedCredit;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userCode'] = userCode;
    data['refundDays'] = refundDays;
    data['giver_user_id'] = giverUserId;
    data['unlimited_credit'] = unlimitedCredit;
    return data;
  }
}

class Recipient {
  Recipient(
      {this.id, this.firstName, this.lastName, this.email, this.userCode});

  Recipient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    userCode = json['userCode'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? userCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['userCode'] = userCode;
    return data;
  }
}

class CreditWallet {
  CreditWallet(
      {this.id,
      this.userId,
      this.balance,
      this.currency,
      this.status,
      this.lastTransactionAt,
      this.createdAt,
      this.updatedAt,
      this.user});

  CreditWallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    balance = json['balance'];
    currency = json['currency'];
    status = json['status'];
    lastTransactionAt = json['last_transaction_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? Recipient.fromJson(json['user']) : null;
  }
  int? id;
  int? userId;
  String? balance;
  String? currency;
  String? status;
  String? lastTransactionAt;
  String? createdAt;
  String? updatedAt;
  Recipient? user;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['balance'] = balance;
    data['currency'] = currency;
    data['status'] = status;
    data['last_transaction_at'] = lastTransactionAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
