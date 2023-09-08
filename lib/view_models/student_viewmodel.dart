import 'package:fifth_exam/data/models/student/student_model.dart';
import 'package:fifth_exam/data/repository/student_repository.dart';
import 'package:flutter/cupertino.dart';

class StudentViewModel extends ChangeNotifier {
  final StudentRepository studentRepository;
  StudentViewModel({required this.studentRepository}) {
    listenStudents();
  }

  addStudent(StudentModel studentModel) =>
      studentRepository.addStudent(studentModel: studentModel);

  updateStudents(StudentModel studentModel) =>
      studentRepository.updateStudent(studentModel: studentModel);

  deleteStudent(String id) => studentRepository.deleteStudent(docId: id);

  Stream<List<StudentModel>> getStudents() => studentRepository.getStudents();
  List<StudentModel> students = [];
  listenStudents() async {
    studentRepository.getStudents().listen((allStudent) {
      students = allStudent;
      notifyListeners();
    });
  }
}
