import 'package:fifth_exam/ui/animations/animation.dart';
import 'package:fifth_exam/ui/firebase/students_page.dart';
import 'package:fifth_exam/ui/users/usersPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam 5"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const StudentsPage()));
                },
                child: const Text(
                  "Firebase",
                  style: TextStyle(color: Colors.amber, fontSize: 24),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const UsersPage()));
                },
                child: const Text(
                  "Dio",
                  style: TextStyle(color: Colors.lightGreen, fontSize: 24),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Animations()));
                },
                child: const Text(
                  "Animations",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
