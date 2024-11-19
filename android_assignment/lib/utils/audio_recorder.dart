// lib/utils/audio_recorder.dart

import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecorder {
  FlutterSoundRecorder? _recorder;
  bool isRecording = false;

  AudioRecorder() {
    _recorder = FlutterSoundRecorder();
  }

  // Initialize the recorder
  Future<void> initRecorder() async {
    // Initialize the recorder based on the current flutter_sound version
    if (!(_recorder!.isStopped)) {
      await _recorder!.openRecorder();
    }
  }

  // Start recording
  Future<void> startRecording() async {
    if (!isRecording) {
      Directory tempDir = await getTemporaryDirectory();
      String filePath = '${tempDir.path}/audio_recording.wav';

      await _recorder!.startRecorder(
        toFile: filePath,
        codec: Codec.pcm16WAV,
      );

      isRecording = true;
    }
  }

  // Stop recording and get file path
  Future<String?> stopRecording() async {
    if (isRecording) {
      String? path = await _recorder!.stopRecorder();
      isRecording = false;
      return path;
    }
    return null;
  }

  // Dispose the recorder
  Future<void> dispose() async {
    if (!(_recorder!.isStopped)) {
      await _recorder!.closeRecorder();
    }
  }
}
