
import 'package:flutter/material.dart';
import 'package:health_bridge/services/ocr_service.dart';
import 'package:health_bridge/services/tts_service.dart';

class PrescriptionReaderScreen extends StatefulWidget {
  const PrescriptionReaderScreen({super.key});

  @override
  _PrescriptionReaderScreenState createState() => _PrescriptionReaderScreenState();
}

class _PrescriptionReaderScreenState extends State<PrescriptionReaderScreen> {
  final OcrService _ocrService = OcrService();
  final TtsService _ttsService = TtsService();
  String? _scannedText;

  @override
  void dispose() {
    _ocrService.dispose();
    _ttsService.dispose();
    super.dispose();
  }

  Future<void> _scanPrescription() async {
    final String? scannedText = await _ocrService.scanImage();
    setState(() {
      _scannedText = scannedText;
    });
  }

  void _readPrescriptionAloud() {
    if (_scannedText != null) {
      _ttsService.speak(_scannedText!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Prescription'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_scannedText != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _scannedText!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ElevatedButton(onPressed: _scanPrescription, child: const Text('Scan')),
            if (_scannedText != null)
              ElevatedButton(onPressed: _readPrescriptionAloud, child: const Text('Read Aloud')),
          ],
        ),
      ),
    );
  }
}
