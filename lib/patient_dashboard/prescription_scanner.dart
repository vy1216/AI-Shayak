import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../services/ocr_service.dart';

class PrescriptionScanner extends StatefulWidget {
  const PrescriptionScanner({super.key});

  @override
  _PrescriptionScannerState createState() => _PrescriptionScannerState();
}

class _PrescriptionScannerState extends State<PrescriptionScanner> {
  File? _image;
  final picker = ImagePicker();
  final _ocrService = OcrService();
  String _extractedText = '';

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _extractedText = ''; // Clear previous text
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _processImage() async {
    if (_image == null) return;
    final text = await _ocrService.processImage(_image!);
    setState(() {
      _extractedText = text;
    });
  }

  void _speakText() {
    if (_extractedText.isNotEmpty) {
      _ocrService.speak(_extractedText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Prescription'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              _image == null
                  ? const Text('No image selected.')
                  : Image.file(_image!),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _getImage(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Take Photo'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _getImage(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library),
                    label: const Text('From Gallery'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (_image != null)
                ElevatedButton(
                  onPressed: _processImage,
                  child: const Text('Process Prescription'),
                ),
              const SizedBox(height: 20),
              if (_extractedText.isNotEmpty)
                Column(
                  children: [
                    const Text(
                      'Extracted Text:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(_extractedText),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _speakText,
                      icon: const Icon(Icons.volume_up),
                      label: const Text('Read Aloud'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
