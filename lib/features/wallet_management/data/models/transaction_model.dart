class TransactionDataModel {
  TransactionDataModel({this.datam, this.pagination});

  TransactionDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      datam = <Datam>[];
      json['data'].forEach((v) {
        datam!.add(Datam.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }
  List<Datam>? datam;
  Pagination? pagination;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (datam != null) {
      data['datam'] = datam!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Datam {
  Datam(
      {this.id,
      this.walletId,
      this.transactionType,
      this.amount,
      this.balanceBefore,
      this.balanceAfter,
      this.transactionReference,
      this.description,
      this.relatedBookingId,
      this.relatedCommissionId,
      this.status,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.booking,
      this.commission});

  Datam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    walletId = json['wallet_id'];
    transactionType = json['transaction_type'];
    amount = json['amount'];
    balanceBefore = json['balance_before'];
    balanceAfter = json['balance_after'];
    transactionReference = json['transaction_reference'];
    description = json['description'];
    relatedBookingId = json['related_booking_id'];
    relatedCommissionId = json['related_commission_id'];
    status = json['status'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    booking =
        json['booking'] != null ? Booking.fromJson(json['booking']) : null;
    commission = json['commission'] != null
        ? Commission.fromJson(json['commission'])
        : null;
  }
  int? id;
  int? walletId;
  String? transactionType;
  String? amount;
  String? balanceBefore;
  String? balanceAfter;
  String? transactionReference;
  String? description;
  int? relatedBookingId;
  int? relatedCommissionId;
  String? status;
  Metadata? metadata;
  String? createdAt;
  String? updatedAt;
  Booking? booking;
  Commission? commission;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['wallet_id'] = walletId;
    data['transaction_type'] = transactionType;
    data['amount'] = amount;
    data['balance_before'] = balanceBefore;
    data['balance_after'] = balanceAfter;
    data['transaction_reference'] = transactionReference;
    data['description'] = description;
    data['related_booking_id'] = relatedBookingId;
    data['related_commission_id'] = relatedCommissionId;
    data['status'] = status;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (booking != null) {
      data['booking'] = booking!.toJson();
    }
    if (commission != null) {
      data['commission'] = commission!.toJson();
    }
    return data;
  }
}

class Metadata {
  Metadata(
      {this.fareType,
      this.userRole,
      this.baseAmount,
      this.markupAmount,
      this.hierarchyLevel});

  Metadata.fromJson(Map<String, dynamic> json) {
    fareType = json['fare_type'];
    userRole = json['user_role'];
    baseAmount = json['base_amount'];
    markupAmount = double.parse(json['markup_amount']?.toString() ?? '0');
    hierarchyLevel = json['hierarchy_level'];
  }
  String? fareType;
  String? userRole;
  int? baseAmount;
  double? markupAmount;
  int? hierarchyLevel;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fare_type'] = fareType;
    data['user_role'] = userRole;
    data['base_amount'] = baseAmount;
    data['markup_amount'] = markupAmount;
    data['hierarchy_level'] = hierarchyLevel;
    return data;
  }
}

class Booking {
  Booking({this.bookingReference, this.bookingType});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingReference = json['booking_reference'];
    bookingType = json['booking_type'];
  }
  String? bookingReference;
  String? bookingType;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_reference'] = bookingReference;
    data['booking_type'] = bookingType;
    return data;
  }
}

class Commission {
  Commission({this.id, this.commissionAmount, this.userRole});

  Commission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commissionAmount = json['commission_amount'];
    userRole = json['user_role'];
  }
  int? id;
  String? commissionAmount;
  String? userRole;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['commission_amount'] = commissionAmount;
    data['user_role'] = userRole;
    return data;
  }
}

class Pagination {
  Pagination(
      {this.page,
      this.limit,
      this.total,
      this.totalPages,
      this.hasNext,
      this.hasPrev});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPages = json['totalPages'];
    hasNext = json['hasNext'];
    hasPrev = json['hasPrev'];
  }
  int? page;
  int? limit;
  int? total;
  int? totalPages;
  bool? hasNext;
  bool? hasPrev;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    data['totalPages'] = totalPages;
    data['hasNext'] = hasNext;
    data['hasPrev'] = hasPrev;
    return data;
  }
}
