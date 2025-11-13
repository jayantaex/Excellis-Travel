// ignore_for_file: unnecessary_new

class ProfileModel {

  ProfileModel(
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
      this.updatedAt,
      this.userRole,
      this.hierarchyLevel});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
    userRole = json['userRole'] != null
        ? new UserRole.fromJson(json['userRole'])
        : null;
    hierarchyLevel = json['hierarchy_level'];
  }
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
  UserRole? userRole;
  int? hierarchyLevel;

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
    if (userRole != null) {
      data['userRole'] = userRole!.toJson();
    }
    data['hierarchy_level'] = hierarchyLevel;
    return data;
  }
}

class UserRole {

  UserRole({this.hierarchyLevel});

  UserRole.fromJson(Map<String, dynamic> json) {
    hierarchyLevel = json['hierarchy_level'];
  }
  int? hierarchyLevel;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hierarchy_level'] = hierarchyLevel;
    return data;
  }
}
