class StudentModel {
  final String id;
  final String userId;
  final String name;
  final String email;
  final String rollNumber;
  final String classId;
  final String className;
  final String section;
  final String? phone;
  final String? profileImage;
  final List<String> parentIds;
  final DateTime admissionDate;
  final DateTime dateOfBirth;
  final String? address;

  StudentModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.rollNumber,
    required this.classId,
    required this.className,
    required this.section,
    this.phone,
    this.profileImage,
    required this.parentIds,
    required this.admissionDate,
    required this.dateOfBirth,
    this.address,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      rollNumber: json['rollNumber'] ?? '',
      classId: json['classId'] ?? '',
      className: json['className'] ?? '',
      section: json['section'] ?? '',
      phone: json['phone'],
      profileImage: json['profileImage'],
      parentIds: List<String>.from(json['parentIds'] ?? []),
      admissionDate: json['admissionDate'] != null
          ? DateTime.parse(json['admissionDate'])
          : DateTime.now(),
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : DateTime.now(),
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'rollNumber': rollNumber,
      'classId': classId,
      'className': className,
      'section': section,
      'phone': phone,
      'profileImage': profileImage,
      'parentIds': parentIds,
      'admissionDate': admissionDate.toIso8601String(),
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'address': address,
    };
  }
}
