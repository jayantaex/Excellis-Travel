class AuthResponseModel {
  bool? success;
  String? message;
  Data? data;
  int? statusCode;
  String? timestamp;

  AuthResponseModel(
      {this.success, this.message, this.data, this.statusCode, this.timestamp});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    timestamp = json['timestamp'];
  }

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
  User? user;
  String? token;
  String? refreshToken;

  Data({this.user, this.token, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? status;
  String? emailStatus;
  String? lastLoginAt;
  String? phone;
  String? address;
  String? commissionRate;
  bool? isDirectBooking;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.role,
      this.status,
      this.emailStatus,
      this.lastLoginAt,
      this.phone,
      this.address,
      this.commissionRate,
      this.isDirectBooking,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    status = json['status'];
    emailStatus = json['emailStatus'];
    lastLoginAt = json['lastLoginAt'];
    phone = json['phone'];
    address = json['address'];
    commissionRate = json['commissionRate'];
    isDirectBooking = json['isDirectBooking'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['status'] = status;
    data['emailStatus'] = emailStatus;
    data['lastLoginAt'] = lastLoginAt;
    data['phone'] = phone;
    data['address'] = address;
    data['commissionRate'] = commissionRate;
    data['isDirectBooking'] = isDirectBooking;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
