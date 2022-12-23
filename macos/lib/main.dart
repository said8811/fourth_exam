import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifth_exam/data/repository/student_repository.dart';
import 'package:fifth_exam/ui/home_screen.dart';
import 'package:fifth_exam/view_models/studentViewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => StudentViewModel(
            studentRepository:
                StudentRepository(firestore: FirebaseFirestore.instance)))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
