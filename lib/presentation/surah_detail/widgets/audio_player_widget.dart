import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mazid_app/presentation/audio/presenter/audio_player_presenter.dart';

class AudioPlayerWidget extends StatefulWidget {
  final int surahNumber;

  const AudioPlayerWidget({super.key, required this.surahNumber});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late final AudioController audioController;

  @override
  void initState() {
    super.initState();
    audioController = Get.put(AudioController());
    final formattedNumber = widget.surahNumber.toString().padLeft(3, '0');
    audioController.loadSurah(formattedNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(51),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 3.0,
              thumbShape: SliderComponentShape.noThumb,
              overlayShape: SliderComponentShape.noOverlay,
              trackShape: const RectangularSliderTrackShape(),
            ),
            child: Obx(() {
              return Slider(
                min: 0.0,
                activeColor: Colors.brown,
                inactiveColor: Colors.grey.withAlpha(51),
                max: audioController.totalDuration.value.inSeconds.toDouble(),
                value: audioController.sliderPosition.value,
                onChanged: (value) {
                  audioController.seek(Duration(seconds: value.toInt()));
                },
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous, color: Colors.brown),
                onPressed: audioController.previousAyah,
              ),
              Obx(
                () => IconButton(
                  icon: Icon(
                    audioController.isPlaying.value
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.brown,
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
                icon: const Icon(Icons.stop, color: Colors.brown),
                onPressed: audioController.stopAudio,
              ),
              IconButton(
                icon: const Icon(Icons.skip_next, color: Colors.brown),
                onPressed: audioController.nextAyah,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
