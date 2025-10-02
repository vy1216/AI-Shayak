
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_bridge/doctor_dashboard/patient_list_screen.dart';
import 'package:health_bridge/login/login_screen.dart';
import 'package:health_bridge/patient_dashboard/patient_dashboard_screen.dart';
import 'package:health_bridge/services/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          } else {
            // Simple role-based routing
            if (user.email!.contains('doctor')) {
              return const PatientListScreen();
            } else {
              return const PatientDashboardScreen();
            }
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
