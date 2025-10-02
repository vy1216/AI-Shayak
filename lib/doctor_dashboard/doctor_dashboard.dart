import 'package:flutter/material.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({Key? key}) : super(key: key);

  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  // Mock data for patient list
  final List<Map<String, String>> _patients = [
    {'name': 'Sita', 'last_log': 'High BP: 160/100'},
    {'name': 'Ramesh', 'last_log': 'Sugar: 250 mg/dL'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Dashboard'),
      ),
      body: ListView.builder(
        itemCount: _patients.length,
        itemBuilder: (context, index) {
          final patient = _patients[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(patient['name']!),
              subtitle: Text(patient['last_log']!),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  // TODO: Implement view patient details
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
