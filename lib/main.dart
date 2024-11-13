import 'package:flutter/material.dart';
import 'package:rest_api_flutter_hero/screens/employee_screen.dart';
import 'package:rest_api_flutter_hero/screens/post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeScreen(),
    );
  }
}
