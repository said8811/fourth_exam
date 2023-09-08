import 'package:fifth_exam/ui/animations/animation.dart';
import 'package:fifth_exam/ui/firebase/students_page.dart';
import 'package:fifth_exam/ui/users/users_page.dart';
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
          title: const Text("Test"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const StudentsPage()));
                        },
                        child: const Text(
                          "Firebase",
                          style: TextStyle(color: Colors.amber, fontSize: 24),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const UsersPage()));
                        },
                        child: const Text(
                          "Dio",
                          style:
                              TextStyle(color: Colors.lightGreen, fontSize: 24),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Animations()));
                        },
                        child: const Text(
                          "Animations",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          isExtended: true,
          onPressed: () {},
          child: const Text("+"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomAppBar(
            color: Colors.grey,
            notchMargin: 6,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
            ),
          ),
        ));
  }
}
