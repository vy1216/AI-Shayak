
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_bridge/services/database_service.dart';

class SymptomTrackerScreen extends StatefulWidget {
  const SymptomTrackerScreen({super.key});

  @override
  _SymptomTrackerScreenState createState() => _SymptomTrackerScreenState();
}

class _SymptomTrackerScreenState extends State<SymptomTrackerScreen> {
  final _formKey = GlobalKey<FormState>();
  double? _bloodPressure;
  double? _bloodSugar;
  String? _symptoms;
  final DatabaseService _databaseService = DatabaseService();

  void _saveSymptoms() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _databaseService.addSymptom(user.uid, {
          'bloodPressure': _bloodPressure,
          'bloodSugar': _bloodSugar,
          'symptoms': _symptoms,
          'timestamp': DateTime.now(),
        });
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Symptoms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Blood Pressure'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _bloodPressure = double.tryParse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Blood Sugar (mg/dL)'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _bloodSugar = double.tryParse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Symptoms'),
                onSaved: (value) => _symptoms = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _saveSymptoms, child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
