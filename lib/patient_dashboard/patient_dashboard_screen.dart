
import 'package:flutter/material.dart';
import 'package:health_bridge/prescription_reader/prescription_reader_screen.dart';
import 'package:health_bridge/services/call_service.dart';
import 'package:health_bridge/symptom_tracker/symptom_tracker_screen.dart';

class PatientDashboardScreen extends StatelessWidget {
  const PatientDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CallService callService = CallService();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrescriptionReaderScreen()),
                );
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Scan Prescription'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SymptomTrackerScreen()),
                );
              },
              icon: const Icon(Icons.favorite),
              label: const Text('Track Symptoms'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                callService.call('1234567890'); // Placeholder phone number
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
