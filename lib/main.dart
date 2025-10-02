
import 'package:flutter/material.dart';
import 'package:health_bridge/auth/auth_screen.dart';
import 'package:health_bridge/patient_dashboard/patient_dashboard_screen.dart';
import 'package:health_bridge/doctor_dashboard/doctor_dashboard_screen.dart';

void main() {
  runApp(const HealthBridgeApp());
}

class HealthBridgeApp extends StatelessWidget {
  const HealthBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthBridge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/patient_dashboard': (context) => const PatientDashboardScreen(),
        '/doctor_dashboard': (context) => const DoctorDashboardScreen(),
      },
    );
  }
}
