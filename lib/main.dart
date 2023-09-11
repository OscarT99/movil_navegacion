import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/screens/home_page.dart';
import 'package:portal_de_empleo/presentation/screens/login/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login(),      
    );
  }

  static of(BuildContext context) {}
}
