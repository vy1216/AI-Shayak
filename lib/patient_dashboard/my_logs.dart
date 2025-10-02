import 'package:flutter/material.dart';

class MyLogsScreen extends StatefulWidget {
  const MyLogsScreen({Key? key}) : super(key: key);

  @override
  _MyLogsScreenState createState() => _MyLogsScreenState();
}

class _MyLogsScreenState extends State<MyLogsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bpController = TextEditingController();
  final _sugarController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Logs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _bpController,
                decoration: const InputDecoration(
                  labelText: 'Blood Pressure (e.g., 120/80)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your blood pressure';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _sugarController,
                decoration: const InputDecoration(
                  labelText: 'Sugar Level (e.g., 100 mg/dL)',
                ),
                 validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your sugar level';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight (e.g., 70 kg)',
                ),
                 validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Save the logs to the database
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logs saved!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Logs'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
