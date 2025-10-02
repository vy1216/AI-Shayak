import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:health_bridge/patient_dashboard/my_logs.dart';
import 'package:health_bridge/patient_dashboard/scan_prescription.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({Key? key}) : super(key: key);

  @override
  _PatientDashboardState createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () async {
                final cameras = await availableCameras();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanPrescriptionScreen(cameras: cameras),
                  ),
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
                  MaterialPageRoute(builder: (context) => const MyLogsScreen()),
                );
              },
              icon: const Icon(Icons.notes),
              label: const Text('My Logs'),
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
