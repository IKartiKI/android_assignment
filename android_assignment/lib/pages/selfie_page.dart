// lib/pages/selfie_page.dart

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class SelfiePage extends StatefulWidget {
  @override
  _SelfiePageState createState() => _SelfiePageState();
}

class _SelfiePageState extends State<SelfiePage> {
  CameraController? _controller;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _controller = CameraController(frontCamera, ResolutionPreset.high);
    await _controller!.initialize();
    setState(() {});
  }

  void _captureSelfie() async {
    if (_controller != null) {
      final image = await _controller!.takePicture();
      setState(() {
        _capturedImage = image; // Saving the captured image for preview
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Capture Selfie")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _capturedImage == null
                  ? (_controller != null
                      ? CameraPreview(_controller!)
                      : CircularProgressIndicator())
                  : Image.file(
                      File(_capturedImage!.path),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  child: Text(_capturedImage == null
                      ? "Capture Selfie"
                      : "Retake Selfie"),
                  onPressed: () {
                    if (_capturedImage == null) {
                      _captureSelfie();
                    } else {
                      setState(() {
                        _capturedImage = null; // Reset to take a new selfie
                        _initializeCamera(); // Reinitialize camera for retake
                      });
                    }
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text("Submit"),
                  onPressed: _capturedImage != null
                      ? () {
                          Navigator.pushNamed(context, '/submit');
                        }
                      : null, // Disable submit if no selfie captured
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
