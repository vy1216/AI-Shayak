
import 'package:flutter/material.dart';
import 'package:health_bridge/doctor_dashboard/doctor_dashboard_screen.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For now, we use a hardcoded list of patients
    final patients = [
      {'name': 'John Doe', 'id': 'patient1', 'email': 'patient1@test.com'},
      {'name': 'Jane Smith', 'id': 'testUser', 'email': 'test@test.com'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Patient'),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(patients[index]['name']!),
            subtitle: Text(patients[index]['email']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDashboardScreen(
                    patientId: patients[index]['id']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
