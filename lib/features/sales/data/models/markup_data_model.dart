class MarkupDataModel {
  MarkupDataModel(
      {this.markups,
      this.totalCount,
      this.totalPages,
      this.currentPage,
      this.hasNextPage,
      this.hasPrevPage});

  MarkupDataModel.fromJson(Map<String, dynamic> json) {
    if (json['markups'] != null) {
      markups = <Markups>[];
      json['markups'].forEach((v) {
        markups!.add(Markups.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    hasPrevPage = json['hasPrevPage'];
  }
  List<Markups>? markups;
  int? totalCount;
  int? totalPages;
  int? currentPage;
  bool? hasNextPage;
  bool? hasPrevPage;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (markups != null) {
      data['markups'] = markups!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    data['hasNextPage'] = hasNextPage;
    data['hasPrevPage'] = hasPrevPage;
    return data;
  }
}

class Markups {
  Markups(
      {this.id,
      this.product,
      this.type,
      this.operator,
      this.fareType,
      this.value,
      this.isActive,
      this.currency,
      this.userId,
      this.forRole,
      this.totalMarkupValue,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.owner,
      this.creator,
      this.updater});

  Markups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    type = json['type'];
    operator = json['operator'];
    fareType = json['fareType'];
    value = json['value'];
    isActive = json['isActive'];
    currency = json['currency'];
    userId = json['userId'];
    forRole = json['forRole'];
    totalMarkupValue = json['totalMarkupValue'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    updater = json['updater'] != null ? Owner.fromJson(json['updater']) : null;
  }
  int? id;
  String? product;
  String? type;
  String? operator;
  String? fareType;
  String? value;
  bool? isActive;
  String? currency;
  int? userId;
  String? forRole;
  String? totalMarkupValue;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Owner? owner;
  Creator? creator;
  Owner? updater;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product'] = product;
    data['type'] = type;
    data['operator'] = operator;
    data['fareType'] = fareType;
    data['value'] = value;
    data['isActive'] = isActive;
    data['currency'] = currency;
    data['userId'] = userId;
    data['forRole'] = forRole;
    data['totalMarkupValue'] = totalMarkupValue;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    if (updater != null) {
      data['updater'] = updater!.toJson();
    }
    return data;
  }
}

class Owner {
  Owner({this.id, this.firstName, this.lastName, this.email});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    return data;
  }
}

class Creator {
  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
  }

  Creator({this.id, this.firstName, this.lastName, this.email, this.role});
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
