class TransactionListModel {
  TransactionListModel({
    this.transactions,
    this.pagination,
  });

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        transactions: json['transactions'] == null
            ? null
            : List<Transaction>.from(
                json['transactions']!.map((x) => Transaction.fromJson(x))),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination']),
      );

  final List<Transaction>? transactions;
  final Pagination? pagination;

  Map<String, dynamic> toJson() => {
        'transactions': transactions == null
            ? null
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        'pagination': pagination?.toJson(),
      };
}

class Transaction {
  Transaction({
    this.id,
    this.transactionId,
    this.bookingId,
    this.userId,
    this.amount,
    this.currency,
    this.paymentMethod,
    this.paymentStatus,
    this.transactionType,
    this.description,
    this.referenceNumber,
    this.createdAt,
    this.updatedAt,
    this.booking,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        transactionId: json['transaction_id']?.toString(),
        bookingId: json['booking_id'],
        userId: json['user_id'],
        amount: json['amount']?.toString(),
        currency: json['currency']?.toString(),
        paymentMethod: json['payment_method']?.toString(),
        paymentStatus: json['payment_status']?.toString(),
        transactionType: json['transaction_type']?.toString(),
        description: json['description']?.toString(),
        referenceNumber: json['reference_number']?.toString(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
        booking: json['booking'] == null
            ? null
            : TransactionBooking.fromJson(json['booking']),
      );

  final int? id;
  final String? transactionId;
  final int? bookingId;
  final int? userId;
  final String? amount;
  final String? currency;
  final String? paymentMethod;
  final String? paymentStatus;
  final String? transactionType;
  final String? description;
  final String? referenceNumber;
  final String? createdAt;
  final String? updatedAt;
  final TransactionBooking? booking;

  Map<String, dynamic> toJson() => {
        'id': id,
        'transaction_id': transactionId,
        'booking_id': bookingId,
        'user_id': userId,
        'amount': amount,
        'currency': currency,
        'payment_method': paymentMethod,
        'payment_status': paymentStatus,
        'transaction_type': transactionType,
        'description': description,
        'reference_number': referenceNumber,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'booking': booking?.toJson(),
      };
}

class TransactionBooking {
  TransactionBooking({
    this.id,
    this.bookingReference,
    this.totalAmount,
    this.bookingStatus,
    this.paymentStatus,
  });

  factory TransactionBooking.fromJson(Map<String, dynamic> json) =>
      TransactionBooking(
        id: json['id'],
        bookingReference: json['booking_reference']?.toString(),
        totalAmount: json['total_amount']?.toString(),
        bookingStatus: json['booking_status']?.toString(),
        paymentStatus: json['payment_status']?.toString(),
      );

  final int? id;
  final String? bookingReference;
  final String? totalAmount;
  final String? bookingStatus;
  final String? paymentStatus;

  Map<String, dynamic> toJson() => {
        'id': id,
        'booking_reference': bookingReference,
        'total_amount': totalAmount,
        'booking_status': bookingStatus,
        'payment_status': paymentStatus,
      };
}

class Pagination {
  Pagination({
    this.currentPage,
    this.itemsPerPage,
    this.totalItems,
    this.totalPages,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json['currentPage'],
        itemsPerPage: json['itemsPerPage'],
        totalItems: json['totalItems'],
        totalPages: json['totalPages'],
        hasNextPage: json['hasNextPage'],
        hasPreviousPage: json['hasPreviousPage'],
      );

  final int? currentPage;
  final int? itemsPerPage;
  final int? totalItems;
  final int? totalPages;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'itemsPerPage': itemsPerPage,
        'totalItems': totalItems,
        'totalPages': totalPages,
        'hasNextPage': hasNextPage,
        'hasPreviousPage': hasPreviousPage,
      };
}

