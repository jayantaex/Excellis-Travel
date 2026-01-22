class OverDueDataModel {
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
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    recipient = json['recipient'] != null
        ? new Recipient.fromJson(json['recipient'])
        : null;
    creditWallet = json['creditWallet'] != null
        ? new CreditWallet.fromJson(json['creditWallet'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['credit_wallet_id'] = this.creditWalletId;
    data['recipient_user_id'] = this.recipientUserId;
    data['amount'] = this.amount;
    data['repayment_date'] = this.repaymentDate;
    data['repayment_status'] = this.repaymentStatus;
    data['repayment_reminder_sent'] = this.repaymentReminderSent;
    data['last_reminder_sent_at'] = this.lastReminderSentAt;
    data['auto_deduction_attempted'] = this.autoDeductionAttempted;
    data['auto_deduction_date'] = this.autoDeductionDate;
    data['related_wallet_transaction_id'] = this.relatedWalletTransactionId;
    data['description'] = this.description;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.recipient != null) {
      data['recipient'] = this.recipient!.toJson();
    }
    if (this.creditWallet != null) {
      data['creditWallet'] = this.creditWallet!.toJson();
    }
    return data;
  }
}

class Metadata {
  String? userCode;
  int? refundDays;
  int? giverUserId;
  bool? unlimitedCredit;

  Metadata(
      {this.userCode, this.refundDays, this.giverUserId, this.unlimitedCredit});

  Metadata.fromJson(Map<String, dynamic> json) {
    userCode = json['userCode'];
    refundDays = json['refundDays'];
    giverUserId = json['giver_user_id'];
    unlimitedCredit = json['unlimited_credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userCode'] = this.userCode;
    data['refundDays'] = this.refundDays;
    data['giver_user_id'] = this.giverUserId;
    data['unlimited_credit'] = this.unlimitedCredit;
    return data;
  }
}

class Recipient {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? userCode;

  Recipient(
      {this.id, this.firstName, this.lastName, this.email, this.userCode});

  Recipient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    userCode = json['userCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['userCode'] = this.userCode;
    return data;
  }
}

class CreditWallet {
  int? id;
  int? userId;
  String? balance;
  String? currency;
  String? status;
  String? lastTransactionAt;
  String? createdAt;
  String? updatedAt;
  Recipient? user;

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
    user = json['user'] != null ? new Recipient.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['balance'] = this.balance;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['last_transaction_at'] = this.lastTransactionAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
