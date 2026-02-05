class ExamModel {
  final String id;
  final String name;
  final String classId;
  final String subjectId;
  final String subjectName;
  final DateTime date;
  final int totalMarks;
  final int passingMarks;
  final String examType; // 'unit-test', 'mid-term', 'final'
  final String? description;

  ExamModel({
    required this.id,
    required this.name,
    required this.classId,
    required this.subjectId,
    required this.subjectName,
    required this.date,
    required this.totalMarks,
    required this.passingMarks,
    required this.examType,
    this.description,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      classId: json['classId'] ?? '',
      subjectId: json['subjectId'] ?? '',
      subjectName: json['subjectName'] ?? '',
      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : DateTime.now(),
      totalMarks: json['totalMarks'] ?? 100,
      passingMarks: json['passingMarks'] ?? 40,
      examType: json['examType'] ?? 'unit-test',
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'classId': classId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'date': date.toIso8601String(),
      'totalMarks': totalMarks,
      'passingMarks': passingMarks,
      'examType': examType,
      'description': description,
    };
  }
}

class ExamResultModel {
  final String id;
  final String examId;
  final String studentId;
  final int marksObtained;
  final String grade;
  final int rank;
  final String? remarks;

  ExamResultModel({
    required this.id,
    required this.examId,
    required this.studentId,
    required this.marksObtained,
    required this.grade,
    required this.rank,
    this.remarks,
  });

  factory ExamResultModel.fromJson(Map<String, dynamic> json) {
    return ExamResultModel(
      id: json['id'] ?? '',
      examId: json['examId'] ?? '',
      studentId: json['studentId'] ?? '',
      marksObtained: json['marksObtained'] ?? 0,
      grade: json['grade'] ?? 'F',
      rank: json['rank'] ?? 0,
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'examId': examId,
      'studentId': studentId,
      'marksObtained': marksObtained,
      'grade': grade,
      'rank': rank,
      'remarks': remarks,
    };
  }
}
