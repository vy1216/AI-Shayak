
import 'package:flutter/material.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Dashboard'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual patient count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Patient ${index + 1}'),
            subtitle: const Text('Last check-in: 2 hours ago'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to patient details screen
            },
          );
        },
      ),
    );
  }
}
