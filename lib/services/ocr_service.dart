import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';

class OcrService {
  Future<String> processImage(File image) async {
    final inputImage = InputImage.fromFile(image);
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();
    return recognizedText.text;
  }

  // Placeholder for text-to-speech functionality
  void speak(String text) {
    // Implement TTS logic here
    print("Speaking: $text");
  }
}
