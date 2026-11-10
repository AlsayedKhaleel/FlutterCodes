/*
 * main.dart
 *
 * Copyright (c) 2020-2026 Ilia Chirkunov <cheebeez@yandex.com>
 *
 * This source code is licensed under the CC BY-NC-SA 4.0.
 * See https://creativecommons.org/licenses/by-nc-sa/4.0/
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:radio_player/radio_player.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RadioPlayerExample());
}

class RadioPlayerExample extends StatefulWidget {
  const RadioPlayerExample({super.key});

  @override
  State<RadioPlayerExample> createState() => _RadioPlayerExampleState();
}

class _RadioPlayerExampleState extends State<RadioPlayerExample> {
  PlaybackState _playbackState = PlaybackState.playing;
  Metadata? _metadata;

  StreamSubscription? _playbackStateSubscription;
  StreamSubscription? _metadataSubscription;
  StreamSubscription? _remoteCommandSubscription;

  /// Initializes the plugin and starts listening to streams.
  @override
  void initState() {
    super.initState();

    // Set the initial radio station.
    RadioPlayer.setStation(
      title: 'Radio Player',
      url: "https://n03.radiojar.com/8s5u5tpdtwzuv",
      // url: 'http://stream-uk1.radioparadise.com/aac-320',
      //url: 'http://ice1.somafm.com/groovesalad-128-mp3',
      // logoAssetPath: 'assets/cover.jpg',
    );

    // Listen to playback state changes.
    _playbackStateSubscription = RadioPlayer.playbackStateStream.listen((
      playbackState,
    ) {
      _playbackState = playbackState;
      setState(() {});
    });

    // Listen to metadata changes.
    _metadataSubscription = RadioPlayer.metadataStream.listen((metadata) {
      _metadata = metadata;
      setState(() {});
    });

    // Enable the next and previous track buttons.
    RadioPlayer.setNavigationControls(
      showNextButton: true,
      showPreviousButton: true,
    );

    // Listen to remote control commands.
    _remoteCommandSubscription = RadioPlayer.remoteCommandStream.listen((
      command,
    ) {
      debugPrint('Remote command received: $command');
    });

    // Enable the audio visualizer.
    RadioPlayer.setVisualizerEnabled(true);
  }

  /// Disposes of stream subscriptions.
  @override
  void dispose() {
    _playbackStateSubscription?.cancel();
    _metadataSubscription?.cancel();
    _remoteCommandSubscription?.cancel();

    RadioPlayer.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Radio Player')),
        body: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       // Displays the artwork for the current track or a default image.
          //       Artwork(data: _metadata?.artworkData),
          //       SizedBox(height: 20),

          //       // Displays the artist and title of the current track.
          //       Track(artist: _metadata?.artist, title: _metadata?.title),
          //       SizedBox(height: 40),c

          //       // Renders the audio visualizer based on the live audio stream.
          //       RadioVisualizer(
          //         builder: (context, data) => Visualizer(visualizerData: data),
          //       ),
          //     ],
          //   ),
        ),

        // A FloatingActionButton that controls playback.
        // floatingActionButton: PlayButton(playbackState: _playbackState),
      ),
    );
  }
}
