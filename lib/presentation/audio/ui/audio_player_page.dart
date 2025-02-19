import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mazid_app/presentation/audio/presenter/audio_player_presenter.dart';

class AudioPlayerScreen extends StatelessWidget {
  final AudioController audioController = Get.put(AudioController());

  AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quran Audio Player")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 আয়াতের নাম দেখানো
            Text(
              "Surah Al-Fatihah",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // 🔹 SeekBar (Total Duration অনুযায়ী)
            Obx(() {
              final totalDuration =
                  audioController.totalDuration.value.inSeconds.toDouble();
              final currentPosition =
                  audioController.currentPosition.value.inSeconds.toDouble();

              return Column(
                children: [
                  Slider(
                    min: 0.0,
                    max: totalDuration,
                    value: currentPosition.clamp(0.0, totalDuration),
                    onChanged: (value) {
                      // Only update visual position while dragging
                      audioController.currentPosition.value = Duration(
                        seconds: value.toInt(),
                      );
                    },
                    onChangeEnd: (value) {
                      audioController.seek(Duration(seconds: value.toInt()));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(
                          Duration(seconds: currentPosition.toInt()),
                        ),
                      ),
                      Text(
                        _formatDuration(audioController.totalDuration.value),
                      ),
                    ],
                  ),
                ],
              );
            }),

            SizedBox(height: 20),

            // 🔹 Playback Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous, size: 40),
                  onPressed: () => audioController.previousAyah(),
                ),
                Obx(
                  () => IconButton(
                    icon: Icon(
                      audioController.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 40,
                    ),
                    onPressed: () {
                      if (audioController.isPlaying.value) {
                        audioController.pauseAudio();
                      } else {
                        audioController.playAudio();
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, size: 40),
                  onPressed: () => audioController.nextAyah(),
                ),
                IconButton(
                  icon: Icon(Icons.stop, size: 40),
                  onPressed: () => audioController.stopAudio(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
