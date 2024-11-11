import 'package:flutter/material.dart';
import 'package:rest_api_flutter_hero/models/employee.dart';
import 'package:rest_api_flutter_hero/services/employee_services.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee data"),
        actions: [
          IconButton(
              onPressed: () {
                print(EmployeeServices().getAllEmployeeData());
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
          future: EmployeeServices().getAllEmployeeData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error fetching data'),
              );
            }
            if (snapshot.hasData) {
              var data = snapshot.data as List<Employee>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: data[index].avatar != null
                            ? NetworkImage(data[index].avatar!)
                            : AssetImage('assets/PXL_20220502_200915025.NIGHT.jpg') as ImageProvider,
                      ),
                      title: Text(
                        "${data[index].firstName ?? 'First'} ${data[index].lastName ?? 'Last'}",
                      ),
                      subtitle: Text(
                        data[index].email ?? 'No email available',
                      ),
                    );

                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
