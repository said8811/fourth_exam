import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifth_exam/data/models/student/studenmodel.dart';

class StudentRepository {
  final FirebaseFirestore _firestore;

  StudentRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<void> addStudent({required StudentModel studentModel}) async {
    try {
      DocumentReference newStudent =
          await _firestore.collection("students").add(studentModel.toJson());
      await _firestore.collection("students").doc(newStudent.id).update({
        "studentId": newStudent.id,
      });
      print("Student qo'shildi");
    } on FirebaseException catch (er) {
      print(er.message.toString());
    }
  }

  Future<void> updateStudent({required StudentModel studentModel}) async {
    try {
      await _firestore
          .collection("students")
          .doc(studentModel.studentId)
          .update(studentModel.toJson());

      print("Student yangilandi!");
    } on FirebaseException catch (er) {
      print(er.message.toString());
    }
  }

  Future<void> deleteStudent({required String docId}) async {
    try {
      await _firestore.collection("students").doc(docId).delete();
      print("Student o'chirildi!");
    } on FirebaseException catch (er) {
      print(er.message.toString());
    }
  }

  Stream<List<StudentModel>> getStudents() =>
      _firestore.collection("students").snapshots().map(
            (event1) => event1.docs
                .map((doc) => StudentModel.fromJson(doc.data()))
                .toList(),
          );
}
