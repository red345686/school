class FeeModel {
  final String id;
  final String studentId;
  final String classId;
  final double totalAmount;
  final double paidAmount;
  final double dueAmount;
  final DateTime dueDate;
  final String status; // 'paid', 'pending', 'overdue'
  final List<FeeInstallment> installments;

  FeeModel({
    required this.id,
    required this.studentId,
    required this.classId,
    required this.totalAmount,
    required this.paidAmount,
    required this.dueAmount,
    required this.dueDate,
    required this.status,
    required this.installments,
  });

  factory FeeModel.fromJson(Map<String, dynamic> json) {
    return FeeModel(
      id: json['id'] ?? '',
      studentId: json['studentId'] ?? '',
      classId: json['classId'] ?? '',
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      paidAmount: (json['paidAmount'] ?? 0).toDouble(),
      dueAmount: (json['dueAmount'] ?? 0).toDouble(),
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'])
          : DateTime.now(),
      status: json['status'] ?? 'pending',
      installments:
          (json['installments'] as List<dynamic>?)
              ?.map((e) => FeeInstallment.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'classId': classId,
      'totalAmount': totalAmount,
      'paidAmount': paidAmount,
      'dueAmount': dueAmount,
      'dueDate': dueDate.toIso8601String(),
      'status': status,
      'installments': installments.map((e) => e.toJson()).toList(),
    };
  }
}

class FeeInstallment {
  final String id;
  final double amount;
  final DateTime dueDate;
  final bool isPaid;
  final DateTime? paidDate;
  final String? transactionId;
  final String? receiptUrl;

  FeeInstallment({
    required this.id,
    required this.amount,
    required this.dueDate,
    required this.isPaid,
    this.paidDate,
    this.transactionId,
    this.receiptUrl,
  });

  factory FeeInstallment.fromJson(Map<String, dynamic> json) {
    return FeeInstallment(
      id: json['id'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'])
          : DateTime.now(),
      isPaid: json['isPaid'] ?? false,
      paidDate: json['paidDate'] != null
          ? DateTime.parse(json['paidDate'])
          : null,
      transactionId: json['transactionId'],
      receiptUrl: json['receiptUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'dueDate': dueDate.toIso8601String(),
      'isPaid': isPaid,
      'paidDate': paidDate?.toIso8601String(),
      'transactionId': transactionId,
      'receiptUrl': receiptUrl,
    };
  }
}
