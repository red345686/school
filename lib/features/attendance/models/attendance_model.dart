class AttendanceModel {
  final String id;
  final String studentId;
  final String classId;
  final DateTime date;
  final bool isPresent;
  final String? reason;
  final String? remarks;

  AttendanceModel({
    required this.id,
    required this.studentId,
    required this.classId,
    required this.date,
    required this.isPresent,
    this.reason,
    this.remarks,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['id'] ?? '',
      studentId: json['studentId'] ?? '',
      classId: json['classId'] ?? '',
      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : DateTime.now(),
      isPresent: json['isPresent'] ?? false,
      reason: json['reason'],
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'classId': classId,
      'date': date.toIso8601String(),
      'isPresent': isPresent,
      'reason': reason,
      'remarks': remarks,
    };
  }
}
