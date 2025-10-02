
import 'package:flutter/material.dart';

class PatientDashboardScreen extends StatelessWidget {
  const PatientDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement prescription scan functionality
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Scan Prescription'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement symptom tracker functionality
              },
              icon: const Icon(Icons.favorite),
              label: const Text('Track Symptoms'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement call doctor functionality
              },
              icon: const Icon(Icons.call),
              label: const Text('Call Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
