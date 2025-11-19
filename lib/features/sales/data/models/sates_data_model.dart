class SalesDataModel {
  SalesDataModel({this.success, this.commissions, this.pagination});

  SalesDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    totalMarkup = double.parse(json['totalMarkup'].toStringAsFixed(2));
    totalSales = double.parse(json['totalSales'].toStringAsFixed(2));
    if (json['commissions'] != null) {
      commissions = <Commissions>[];
      json['commissions'].forEach((v) {
        commissions!.add(Commissions.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }
  bool? success;
  List<Commissions>? commissions;
  Pagination? pagination;
  double? totalMarkup;
  double? totalSales;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (commissions != null) {
      data['commissions'] = commissions!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Commissions {
  Commissions(
      {this.id,
      this.bookingId,
      this.userId,
      this.userRole,
      this.baseAmount,
      this.markupAmount,
      this.commissionAmount,
      this.fareType,
      this.hierarchyLevel,
      this.status,
      this.currency,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.booking});

  Commissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    userId = json['user_id'];
    userRole = json['user_role'];
    baseAmount = json['base_amount'];
    markupAmount = json['markup_amount'];
    commissionAmount = json['commission_amount'];
    fareType = json['fare_type'];
    hierarchyLevel = json['hierarchy_level'];
    status = json['status'];
    currency = json['currency'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    booking =
        json['booking'] != null ? Booking.fromJson(json['booking']) : null;
  }
  int? id;
  int? bookingId;
  int? userId;
  String? userRole;
  String? baseAmount;
  String? markupAmount;
  String? commissionAmount;
  String? fareType;
  int? hierarchyLevel;
  String? status;
  String? currency;
  Metadata? metadata;
  String? createdAt;
  String? updatedAt;
  User? user;
  Booking? booking;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['booking_id'] = bookingId;
    data['user_id'] = userId;
    data['user_role'] = userRole;
    data['base_amount'] = baseAmount;
    data['markup_amount'] = markupAmount;
    data['commission_amount'] = commissionAmount;
    data['fare_type'] = fareType;
    data['hierarchy_level'] = hierarchyLevel;
    data['status'] = status;
    data['currency'] = currency;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (booking != null) {
      data['booking'] = booking!.toJson();
    }
    return data;
  }
}

class Metadata {
  Metadata.fromJson(Map<String, dynamic> json) {
    amountAfter = json['amountAfter'] != null
        ? double.parse(json['amountAfter'].toStringAsFixed(2))
        : null;
    calculation = json['calculation'];
    amountBefore = json['amountBefore'] != null
        ? double.parse(json['amountBefore'].toStringAsFixed(2))
        : null;
  }

  Metadata({this.amountAfter, this.calculation, this.amountBefore});
  double? amountAfter;
  String? calculation;
  double? amountBefore;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amountAfter'] = amountAfter;
    data['calculation'] = calculation;
    data['amountBefore'] = amountBefore;
    return data;
  }
}

class User {
  User({this.id, this.firstName, this.lastName, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
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

class Booking {
  Booking(
      {this.id,
      this.bookingReference,
      this.totalAmount,
      this.bookingStatus,
      this.paymentStatus});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingReference = json['booking_reference'];
    totalAmount = json['total_amount'];
    bookingStatus = json['booking_status'];
    paymentStatus = json['payment_status'];
  }
  int? id;
  String? bookingReference;
  String? totalAmount;
  String? bookingStatus;
  String? paymentStatus;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['booking_reference'] = bookingReference;
    data['total_amount'] = totalAmount;
    data['booking_status'] = bookingStatus;
    data['payment_status'] = paymentStatus;
    return data;
  }
}

class Pagination {
  Pagination(
      {this.currentPage,
      this.itemsPerPage,
      this.totalItems,
      this.totalPages,
      this.hasNextPage,
      this.hasPreviousPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }
  int? currentPage;
  int? itemsPerPage;
  int? totalItems;
  int? totalPages;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['totalItems'] = totalItems;
    data['totalPages'] = totalPages;
    data['hasNextPage'] = hasNextPage;
    data['hasPreviousPage'] = hasPreviousPage;
    return data;
  }
}
