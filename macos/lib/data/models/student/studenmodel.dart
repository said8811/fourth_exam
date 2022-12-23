class StudentModel {
  String imageUrl;
  String studentName;
  String studentId;

  StudentModel({
    required this.imageUrl,
    required this.studentName,
    required this.studentId,
  });

  factory StudentModel.fromJson(Map<String, dynamic> jsonData) {
    return StudentModel(
        imageUrl: jsonData['imageUrl'] as String? ?? '',
        studentName: jsonData['studentName'] as String? ?? '',
        studentId: jsonData['studentId'] as String? ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'studentName': studentName,
      'studentId': studentId,
    };
  }
}
