class CreditBalanceModel {
  CreditBalanceModel(
      {this.success, this.message, this.data, this.statusCode, this.timestamp});

  CreditBalanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    timestamp = json['timestamp'];
  }
  bool? success;
  String? message;
  Data? data;
  int? statusCode;
  String? timestamp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['statusCode'] = statusCode;
    data['timestamp'] = timestamp;
    return data;
  }
}

class Data {
  Data({this.balance, this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    balance = double.parse(json['balance'].toString());
    currency = json['currency'];
  }
  double? balance;
  String? currency;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['currency'] = currency;
    return data;
  }
}
