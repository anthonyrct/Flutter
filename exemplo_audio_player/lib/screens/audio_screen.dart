import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_audio_player/models/audio_model.dart'; // Adicionando importação do AudioModel
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  final AudioModel audio;
  const AudioScreen({Key? key, required this.audio}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer _player;
  bool _isPlaying = true;
  bool _isPaused = false;
  Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.play(widget.audio.url as Source);
    _player.onDurationChanged.listen((Duration duration) {
      setState(() {});
    });
    _player.onDurationChanged.listen((Duration position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _playPause() async {
    if (_isPlaying && !_isPaused) {
      int result = await _player.pause(); // Pausar o áudio
      if (result == 1) { // Verificar se a pausa foi bem-sucedida
        setState(() {
          _isPlaying = false;
          _isPaused = true;
        });
      }
    } else {
      int result = await _player.resume(); // Retomar a reprodução do áudio
      if (result == 1) { // Verificar se a retomada foi bem-sucedida
        setState(() {
          _isPlaying = true;
          _isPaused = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.audio.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isPlaying && !_isPaused ? Icons.pause : Icons.play_arrow),
              iconSize: 60,
              onPressed: _playPause,
            ),
            Text(
              _isPaused ? 'Pausado' : 'Reproduzindo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Position: ${_currentPosition.inSeconds} segundos',
            ),
          ],
        ),
      ),
    );
  }
}
