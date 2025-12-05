class Pagination {
  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json['page'],
        limit: json['limit'],
        total: json['total'],
        totalPages: json['totalPages'],
        hasNext: json['hasNext'],
        hasPrev: json['hasPrev'],
      );

  Pagination({
    this.page,
    this.limit,
    this.total,
    this.totalPages,
    this.hasNext,
    this.hasPrev,
  });
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPages;
  final bool? hasNext;
  final bool? hasPrev;

  Map<String, dynamic> toJson() => {
        'page': page,
        'limit': limit,
        'total': total,
        'totalPages': totalPages,
        'hasNext': hasNext,
        'hasPrev': hasPrev,
      };
}

// --- Commission Model ---

class Commission {
  Commission({
    this.id,
    this.commissionAmount,
    this.userRole,
  });

  factory Commission.fromJson(Map<String, dynamic> json) => Commission(
        id: json['id'],
        commissionAmount: json['commission_amount'],
        userRole: json['user_role'],
      );
  final int? id;
  final String? commissionAmount;
  final String? userRole;

  Map<String, dynamic> toJson() => {
        'id': id,
        'commissionAmount': commissionAmount,
        'userRole': userRole,
      };
}

// --- Booking Model ---

class Booking {
  Booking({
    this.bookingReference,
    this.bookingType,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        bookingReference: json['booking_reference'],
        bookingType: json['booking_type'],
      );
  final String? bookingReference;
  final String? bookingType;

  Map<String, dynamic> toJson() => {
        'bookingReference': bookingReference,
        'bookingType': bookingType,
      };
}

// --- Metadata Model ---

class Metadata {
  Metadata({
    this.fareType,
    this.userRole,
    this.baseAmount,
    this.markupAmount,
    this.hierarchyLevel,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        fareType: json['fare_type'],
        userRole: json['user_role'],
        baseAmount: json['base_amount'],
        markupAmount: json['markup_amount']?.toDouble(),
        hierarchyLevel: json['hierarchy_level'],
      );
  final String? fareType;
  final String? userRole;
  final int? baseAmount;
  final double? markupAmount;
  final int? hierarchyLevel;

  Map<String, dynamic> toJson() => {
        'fareType': fareType,
        'userRole': userRole,
        'baseAmount': baseAmount,
        'markupAmount': markupAmount,
        'hierarchyLevel': hierarchyLevel,
      };
}

// --- Datum Model (Individual Transaction) ---

class Datum {
  Datum({
    this.id,
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
    this.commission,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'],
        walletId: json['wallet_id'],
        transactionType: json['transaction_type'],
        amount: json['amount'],
        balanceBefore: json['balance_before'],
        balanceAfter: json['balance_after'],
        transactionReference: json['transaction_reference'],
        description: json['description'],
        relatedBookingId: json['related_booking_id'],
        relatedCommissionId: json['related_commission_id'],
        status: json['status'],
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata']),
        // Parse ISO 8601 strings into DateTime objects
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        booking:
            json['booking'] == null ? null : Booking.fromJson(json['booking']),
        commission: json['commission'] == null
            ? null
            : Commission.fromJson(json['commission']),
      );
  final int? id;
  final int? walletId;
  final String? transactionType;
  final String? amount;
  final String? balanceBefore;
  final String? balanceAfter;
  final String? transactionReference;
  final String? description;
  final int? relatedBookingId;
  final int? relatedCommissionId;
  final String? status;
  final Metadata? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Booking? booking;
  final Commission? commission;

  Map<String, dynamic> toJson() => {
        'id': id,
        'walletId': walletId,
        'transactionType': transactionType,
        'amount': amount,
        'balanceBefore': balanceBefore,
        'balanceAfter': balanceAfter,
        'transactionReference': transactionReference,
        'description': description,
        'relatedBookingId': relatedBookingId,
        'relatedCommissionId': relatedCommissionId,
        'status': status,
        'metadata': metadata?.toJson(),
        // Format DateTime objects back to ISO 8601 strings
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'booking': booking?.toJson(),
        'commission': commission?.toJson(),
      };
}

// --- Main Data Model ---

class TransactionDataModel {
  TransactionDataModel({
    this.data,
    this.pagination,
  });

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) =>
      TransactionDataModel(
        // Map list of JSON objects to list of Datum objects
        data: json['data'] == null
            ? null
            : List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination']),
      );
  final List<Datum>? data;
  final Pagination? pagination;

  Map<String, dynamic> toJson() => {
        // Map list of Datum objects to list of JSON objects
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        'pagination': pagination?.toJson(),
      };
}
