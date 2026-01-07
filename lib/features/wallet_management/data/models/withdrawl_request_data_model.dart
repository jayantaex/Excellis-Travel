class WithdrawlRequestDataModel {
  WithdrawlRequestDataModel(
      {this.success, this.message, this.data, this.statusCode, this.timestamp});

  WithdrawlRequestDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? WithdrawlRequestData.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    timestamp = json['timestamp'];
  }
  bool? success;
  String? message;
  WithdrawlRequestData? data;
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

class WithdrawlRequestData {
  WithdrawlRequestData({this.requests, this.total, this.page, this.limit, this.hasMore});

  WithdrawlRequestData.fromJson(Map<String, dynamic> json) {
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(Requests.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    hasMore = json['hasMore'];
  }
  List<Requests>? requests;
  int? total;
  int? page;
  int? limit;
  bool? hasMore;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (requests != null) {
      data['requests'] = requests!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    data['hasMore'] = hasMore;
    return data;
  }
}

class Requests {
  Requests({
    this.id,
    this.userId,
    this.amount,
    this.status,
    this.requestedAt,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.requester,
  });

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    status = json['status'];
    requestedAt = json['requested_at'];

    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    requester = json['requester'] != null
        ? Requester.fromJson(json['requester'])
        : null;
  }
  int? id;
  int? userId;
  String? amount;
  String? status;
  String? requestedAt;

  Metadata? metadata;
  String? createdAt;
  String? updatedAt;
  Requester? requester;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['status'] = status;
    data['requested_at'] = requestedAt;

    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (requester != null) {
      data['requester'] = requester!.toJson();
    }

    return data;
  }
}

class Metadata {
  Metadata({this.remark, this.approvers, this.approversCount});

  Metadata.fromJson(Map<String, dynamic> json) {
    remark = json['remark'];
    approvers = json['approvers'].cast<int>();
    approversCount = json['approversCount'];
  }
  String? remark;
  List<int>? approvers;
  int? approversCount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remark'] = remark;
    data['approvers'] = approvers;
    data['approversCount'] = approversCount;
    return data;
  }
}

class Requester {
  Requester({this.id, this.firstName, this.lastName, this.email, this.role});

  Requester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
