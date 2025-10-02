
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_bridge/services/database_service.dart';

class DoctorDashboardScreen extends StatelessWidget {
  final String patientId;

  const DoctorDashboardScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final DatabaseService databaseService = DatabaseService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Symptoms'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: databaseService.getSymptoms(patientId),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              final Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['symptoms'] ?? ''),
                subtitle: Text(
                    'Blood Pressure: ${data['bloodPressure']}\nBlood Sugar: ${data['bloodSugar']}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
