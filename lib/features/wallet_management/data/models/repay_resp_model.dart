class RePayRespModel {
  RePayRespModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    statusCode = json['statusCode'];
    timestamp = json['timestamp'];
  }

  RePayRespModel({this.success, this.message, this.statusCode, this.timestamp});
  bool? success;
  String? message;
  int? statusCode;
  String? timestamp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['timestamp'] = timestamp;
    return data;
  }
}
