import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/screens/home_page.dart';
import 'package:portal_de_empleo/presentation/screens/login/login.dart';
import 'package:portal_de_empleo/presentation/screens/login/register_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Login(),      
    );
  }

  static of(BuildContext context) {}
}