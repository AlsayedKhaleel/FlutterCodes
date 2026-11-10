import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const RadioApp());
}

class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const RadioScreen(),
    );
  }
}

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final AudioPlayer _player = AudioPlayer();

  bool _isPlaying = false;
  bool _isLoading = false;

  final String radioUrl = 'https://n03.radiojar.com/8s5u5tpdtwzuv';
  // 'https://stream.radiojar.com/8s5u5tpdtwzuv';

  Future<void> _toggleRadio() async {
    if (_isLoading) return;

    if (_isPlaying) {
      await _player.stop();

      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
      }
    } else {
      setState(() {
        _isLoading = true;
      });

      try {
        await _player.setUrl(radioUrl);
        await _player.play();

        if (mounted) {
          setState(() {
            _isPlaying = true;
          });
        }
      } catch (e) {
        debugPrint('Radio error: $e');

        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Could not play radio: $e')));
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.radio, size: 80, color: Colors.orange),

            const SizedBox(height: 20),

            const Text(
              'My Radio',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 40),

            GestureDetector(
              onTap: _toggleRadio,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isPlaying ? Colors.red : Colors.orange,
                  boxShadow: [
                    BoxShadow(
                      color: (_isPlaying ? Colors.red : Colors.orange)
                          .withOpacity(0.4),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Icon(
                          _isPlaying ? Icons.stop : Icons.play_arrow,
                          size: 55,
                          color: Colors.white,
                        ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              _isLoading
                  ? 'Connecting...'
                  : _isPlaying
                  ? 'Radio is playing'
                  : 'Tap to listen',
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
