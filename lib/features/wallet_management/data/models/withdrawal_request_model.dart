import 'package:equatable/equatable.dart';

class WithdrawalRequestModel extends Equatable {
  const WithdrawalRequestModel({
    this.id,
    required this.amount,
    required this.accountHolderName,
    required this.accountNumber,
    required this.ifscCode,
    this.status = 'pending',
    this.requestDate,
    this.processedDate,
    this.remarks,
  });

  factory WithdrawalRequestModel.fromJson(Map<String, dynamic> json) =>
      WithdrawalRequestModel(
        id: json['id']?.toString(),
        amount: double.tryParse(json['amount']?.toString() ?? '0') ?? 0.0,
        accountHolderName: json['account_holder_name']?.toString() ?? '',
        accountNumber: json['account_number']?.toString() ?? '',
        ifscCode: json['ifsc_code']?.toString() ?? '',
        status: json['status']?.toString() ?? 'pending',
        requestDate: json['request_date'] != null
            ? DateTime.parse(json['request_date'].toString())
            : null,
        processedDate: json['processed_date'] != null
            ? DateTime.parse(json['processed_date'].toString())
            : null,
        remarks: json['remarks']?.toString(),
      );
  final String? id;
  final double amount;
  final String accountHolderName;
  final String accountNumber;
  final String ifscCode;
  final String? status; // 'pending', 'approved', 'rejected', 'completed'
  final DateTime? requestDate;
  final DateTime? processedDate;
  final String? remarks;

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'amount': amount,
        'account_holder_name': accountHolderName,
        'account_number': accountNumber,
        'ifsc_code': ifscCode,
        'status': status,
        if (requestDate != null) 'request_date': requestDate!.toIso8601String(),
        if (processedDate != null)
          'processed_date': processedDate!.toIso8601String(),
        if (remarks != null) 'remarks': remarks,
      };

  @override
  List<Object?> get props => [
        id,
        amount,
        accountHolderName,
        accountNumber,
        ifscCode,
        status,
        requestDate,
        processedDate,
        remarks,
      ];
}
