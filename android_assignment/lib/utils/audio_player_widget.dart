import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioPath;

  const AudioPlayerWidget(resultData, {required this.audioPath});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer? _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer!.pause();
    } else {
      await _audioPlayer!.play(DeviceFileSource(widget.audioPath));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
      onPressed: _togglePlayPause,
    );
  }
}
