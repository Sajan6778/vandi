import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Audio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var audioPlayer = AudioPlayer();

  List _playlist = [
    "C:/Users/sajan/Downloads/Glimpse-of-Antony-Das-MassTamilan.dev.mp3",
    "C:/Users/sajan/Downloads/Glimpse-of-Harold-Das-MassTamilan.dev.mp3",
    "C:/Users/sajan/Downloads/Bloody-Sweet-MassTamilan.dev.mp3",
    "C:/Users/sajan/OneDrive/Desktop/vandi/lib/widgets/Anbenum-MassTamilan.dev.mp3"
  ];
  var _currentIndex = 0;

  Future<void> _play() async {
    String currentAudio = _playlist[_currentIndex];
    if (currentAudio.startsWith('http') || currentAudio.startsWith('https')) {
      await audioPlayer.play(UrlSource(
        _playlist[0],
      ));
    } else {
      await audioPlayer.play(DeviceFileSource(currentAudio));
    }
  }

  Future<void> _stop() async {
    await audioPlayer.stop();
  }

  void _playNextAudio() {
    setState(() {
      if (_currentIndex < _playlist.length) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
    });
    _play();
  }

  void playPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _play();
    }
  }

  void pause() {
    audioPlayer.pause();
  }

  void resume() {
    audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _play,
              child: Text('Play'),
            ),
            ElevatedButton(
              onPressed: _stop,
              child: Text('Stop'),
            ),
            ElevatedButton(
              onPressed: _playNextAudio,
              child: Text('Next'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pause,
                  child: Text('pause'),
                ),
                ElevatedButton(
                  onPressed: resume,
                  child: Text('resume'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: playPrevious,
              child: Text('Previous'),
            ),
          ],
        ),
      ),
    );
  }
}
