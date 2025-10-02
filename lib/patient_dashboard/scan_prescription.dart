import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ScanPrescriptionScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ScanPrescriptionScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  _ScanPrescriptionScreenState createState() => _ScanPrescriptionScreenState();
}

class _ScanPrescriptionScreenState extends State<ScanPrescriptionScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Prescription')),
      body: CameraPreview(_controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final image = await _controller.takePicture();
            // TODO: Process the image with OCR
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Prescription scanned!')),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}
