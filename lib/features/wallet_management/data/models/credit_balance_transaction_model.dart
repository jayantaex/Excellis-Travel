class CreditBalanceTransactionModel {
  CreditBalanceTransactionModel(
      {this.success, this.message, this.creditTransactionDatam});

  CreditBalanceTransactionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    creditTransactionDatam = json['data'] != null
        ? CreditTransactionDatam.fromJson(json['data'])
        : null;
  }
  bool? success;
  String? message;
  CreditTransactionDatam? creditTransactionDatam;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (creditTransactionDatam != null) {
      data['creditTransactionDatam'] = creditTransactionDatam!.toJson();
    }
    return data;
  }
}

class CreditTransactionDatam {
  CreditTransactionDatam(
      {this.creditTransactions, this.pagination, this.summary});

  CreditTransactionDatam.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      creditTransactions = <CreditTransactions>[];
      json['data'].forEach((v) {
        creditTransactions!.add(CreditTransactions.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    summary =
        json['summary'] != null ? Summary.fromJson(json['summary']) : null;
  }
  List<CreditTransactions>? creditTransactions;
  Pagination? pagination;
  Summary? summary;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (creditTransactions != null) {
      data['creditTransactions'] =
          creditTransactions!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    return data;
  }
}

class CreditTransactions {
  CreditTransactions(
      {this.id,
      this.recipientUserId,
      this.amount,
      this.repaymentDate,
      this.repaymentStatus,
      this.repaymentReminderSent,
      this.lastReminderSentAt,
      this.autoDeductionAttempted,
      this.description,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.recipient});

  CreditTransactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipientUserId = json['recipient_user_id'];
    amount = json['amount'];
    repaymentDate = json['repayment_date'];
    repaymentStatus = json['repayment_status'];
    repaymentReminderSent = json['repayment_reminder_sent'];
    lastReminderSentAt = json['last_reminder_sent_at'];
    autoDeductionAttempted = json['auto_deduction_attempted'];
    description = json['description'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    recipient = json['recipient'] != null
        ? Recipient.fromJson(json['recipient'])
        : null;
  }
  int? id;
  int? recipientUserId;
  int? amount;
  String? repaymentDate;
  String? repaymentStatus;
  bool? repaymentReminderSent;
  String? lastReminderSentAt;
  bool? autoDeductionAttempted;
  String? description;
  Metadata? metadata;
  String? createdAt;
  String? updatedAt;
  Recipient? recipient;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipient_user_id'] = recipientUserId;
    data['amount'] = amount;
    data['repayment_date'] = repaymentDate;
    data['repayment_status'] = repaymentStatus;
    data['repayment_reminder_sent'] = repaymentReminderSent;
    data['last_reminder_sent_at'] = lastReminderSentAt;
    data['auto_deduction_attempted'] = autoDeductionAttempted;
    data['description'] = description;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (recipient != null) {
      data['recipient'] = recipient!.toJson();
    }
    return data;
  }
}

class Metadata {
  Metadata.fromJson(Map<String, dynamic> json) {
    userCode = json['userCode'];
    refundDays = json['refundDays'];
    giverUserId = json['giver_user_id'];
    unlimitedCredit = json['unlimited_credit'];
  }

  Metadata(
      {this.userCode, this.refundDays, this.giverUserId, this.unlimitedCredit});
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

class Pagination {
  Pagination(
      {this.total, this.page, this.limit, this.totalPages, this.hasMore});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    hasMore = json['hasMore'];
  }
  int? total;
  int? page;
  int? limit;
  int? totalPages;
  bool? hasMore;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    data['hasMore'] = hasMore;
    return data;
  }
}

class Summary {
  Summary({this.totalCredits, this.totalRepaid, this.totalPending});

  Summary.fromJson(Map<String, dynamic> json) {
    totalCredits = json['totalCredits'];
    totalRepaid = json['totalRepaid'];
    totalPending = json['totalPending'];
  }
  int? totalCredits;
  int? totalRepaid;
  int? totalPending;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCredits'] = totalCredits;
    data['totalRepaid'] = totalRepaid;
    data['totalPending'] = totalPending;
    return data;
  }
}
