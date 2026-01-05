class CurstomCrTransactionModel {
  CurstomCrTransactionModel({this.summary, this.data});

  CurstomCrTransactionModel.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? Summary.fromJson(json['summary']) : null;
    if (json['data'] != null) {
      data = <CreditTransactionData>[];
      json['data'].forEach((v) {
        data!.add(CreditTransactionData.fromJson(v));
      });
    }
  }
  Summary? summary;
  List<CreditTransactionData>? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  Summary({this.totalCredits, this.totalPending, this.totalRepaid});

  Summary.fromJson(Map<String, dynamic> json) {
    totalCredits = double.parse(json['totalCredits'].toString());
    totalPending = double.parse(json['totalPending'].toString());
    totalRepaid = double.parse(json['totalRepaid'].toString());
  }
  double? totalCredits;
  double? totalPending;
  double? totalRepaid;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCredits'] = totalCredits;
    data['totalPending'] = totalPending;
    data['totalRepaid'] = totalRepaid;
    return data;
  }
}

class CreditTransactionData {
  CreditTransactionData(
      {this.title,
      this.desc,
      this.type,
      this.amount,
      this.txnId,
      this.dateTime,
      this.repaymentDate,
      this.recipient,
      this.rePaymentStatus,
      this.autoDeductionAttempted,
      this.autoDeductionDate,
      this.reminderSent,
      this.paymentReference,
      this.bookingStatus});

  CreditTransactionData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    type = json['type'];
    amount = double.parse(json['amount'].toString());
    txnId = json['txnId'];
    dateTime = json['dateTime'];
    repaymentDate = json['repaymentDate'];
    recipient = json['recipient'] != null
        ? Recipient.fromJson(json['recipient'])
        : null;
    rePaymentStatus = json['rePaymentStatus'];
    autoDeductionAttempted = json['autoDeductionAttempted'];
    autoDeductionDate = json['autoDeductionDate'];
    reminderSent = json['reminderSent'];
    paymentReference = json['paymentReference'];
    bookingStatus = json['bookingStatus'];
  }
  String? title;
  String? desc;
  String? type;
  double? amount;
  String? txnId;
  String? dateTime;
  String? repaymentDate;
  Recipient? recipient;
  String? rePaymentStatus;
  bool? autoDeductionAttempted;
  String? autoDeductionDate;
  bool? reminderSent;
  String? paymentReference;
  String? bookingStatus;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['type'] = type;
    data['amount'] = amount;
    data['txnId'] = txnId;
    data['dateTime'] = dateTime;
    data['repaymentDate'] = repaymentDate;
    if (recipient != null) {
      data['recipient'] = recipient!.toJson();
    }
    data['rePaymentStatus'] = rePaymentStatus;
    data['autoDeductionAttempted'] = autoDeductionAttempted;
    data['autoDeductionDate'] = autoDeductionDate;
    data['reminderSent'] = reminderSent;
    data['paymentReference'] = paymentReference;
    data['bookingStatus'] = bookingStatus;
    return data;
  }
}

class Recipient {
  Recipient.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
    userCode = json['userCode'];
  }

  Recipient(
      {this.email, this.firstName, this.id, this.lastName, this.userCode});
  String? email;
  String? firstName;
  int? id;
  String? lastName;
  String? userCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['id'] = id;
    data['last_name'] = lastName;
    data['userCode'] = userCode;
    return data;
  }
}
