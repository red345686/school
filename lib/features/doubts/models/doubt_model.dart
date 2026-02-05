class DoubtModel {
  final String id;
  final String studentId;
  final String studentName;
  final String subject;
  final String question;
  final String? imageUrl;
  final String? answer;
  final bool isResolved;
  final DateTime createdAt;
  final DateTime? resolvedAt;
  final String? teacherId;

  DoubtModel({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.subject,
    required this.question,
    this.imageUrl,
    this.answer,
    required this.isResolved,
    required this.createdAt,
    this.resolvedAt,
    this.teacherId,
  });

  factory DoubtModel.fromJson(Map<String, dynamic> json) {
    return DoubtModel(
      id: json['id'] ?? '',
      studentId: json['studentId'] ?? '',
      studentName: json['studentName'] ?? '',
      subject: json['subject'] ?? '',
      question: json['question'] ?? '',
      imageUrl: json['imageUrl'],
      answer: json['answer'],
      isResolved: json['isResolved'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      resolvedAt: json['resolvedAt'] != null
          ? DateTime.parse(json['resolvedAt'])
          : null,
      teacherId: json['teacherId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'subject': subject,
      'question': question,
      'imageUrl': imageUrl,
      'answer': answer,
      'isResolved': isResolved,
      'createdAt': createdAt.toIso8601String(),
      'resolvedAt': resolvedAt?.toIso8601String(),
      'teacherId': teacherId,
    };
  }
}
