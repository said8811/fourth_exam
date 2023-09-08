import 'package:fifth_exam/ui/firebase/add_student_page.dart';
import 'package:fifth_exam/ui/firebase/update_page.dart';
import 'package:fifth_exam/view_models/student_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddStudentPage()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Consumer<StudentViewModel>(
              builder: (context, value, child) {
                return value.students.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                        shrinkWrap: true,
                        itemCount: value.students.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            value.students[index].imageUrl),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                value.students[index].studentName,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => UpdatePage(
                                                  studentModel:
                                                      value.students[index],
                                                )));
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    Provider.of<StudentViewModel>(context,
                                            listen: false)
                                        .deleteStudent(
                                            value.students[index].studentId);
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          );
                        },
                      )
                    : const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
