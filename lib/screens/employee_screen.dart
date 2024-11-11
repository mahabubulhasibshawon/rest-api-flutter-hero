import 'package:flutter/material.dart';
import 'package:rest_api_flutter_hero/services/employee_services.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee data"),
        actions: [
          IconButton(onPressed: (){
            EmployeeServices().getAllEmployeeData();
          }, icon: Icon(Icons.refresh))
        ],
      ),
    );
  }
}
