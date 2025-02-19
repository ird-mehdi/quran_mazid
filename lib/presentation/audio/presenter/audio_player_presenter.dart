import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  final AudioPlayer player = AudioPlayer();

  RxBool isPlaying = false.obs;
  Rx<Duration> currentPosition = Duration.zero.obs;
  Rx<Duration> totalDuration = Duration.zero.obs;
  RxDouble sliderPosition = 0.0.obs;

  List<String> ayahFiles = [];
  List<Duration> ayahDurations = [];
  int currentAyahIndex = 0;
  bool isStopped = false;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  @override
  void onInit() {
    super.onInit();
    _initStreams();
    loadSurah("001"); // Default Surah Load
  }

  void _initStreams() {
    _positionSubscription = player.positionStream.listen((position) {
      if (!isStopped) {
        Duration previousDuration = _getPreviousAyahsDuration();
        currentPosition.value = previousDuration + position;
        sliderPosition.value = currentPosition.value.inSeconds.toDouble();
      }
    });

    _playerStateSubscription = player.playerStateStream.listen((state) async {
      if (state.processingState == ProcessingState.completed && !isStopped) {
        if (currentAyahIndex < ayahFiles.length - 1) {
          currentAyahIndex++;
          await _playAyah(currentAyahIndex);
        } else {
          /// 🔥 **পুরো অডিও শেষ হলে আবার প্রথম আয়াত চালু হবে।**
          // currentAyahIndex = 0;
          // await _playAyah(currentAyahIndex);
          stopAudio();
        }
      }
    });
  }

  Future<void> loadSurah(String surahIndex) async {
    try {
      String jsonString = await rootBundle.loadString(
        'assets/audio/$surahIndex/index.json',
      );
      Map<String, dynamic> jsonData = json.decode(jsonString);

      ayahFiles.clear();
      ayahDurations.clear();
      totalDuration.value = Duration.zero;

      for (var key in jsonData["verse"].keys) {
        String filePath =
            "assets/audio/$surahIndex/${jsonData["verse"][key]["file"]}";
        ayahFiles.add(filePath);

        final duration = await player.setAsset(filePath);
        if (duration != null) {
          ayahDurations.add(duration);
          totalDuration.value += duration;
        }
      }

      currentAyahIndex = 0;
      isPlaying.value = false;
      isStopped = false;
      currentPosition.value = Duration.zero;
      await player.setAsset(ayahFiles[currentAyahIndex]);
    } catch (e) {
      print("Error loading Surah: $e");
    }
  }

  Duration _getPreviousAyahsDuration() {
    return ayahDurations
        .sublist(0, currentAyahIndex)
        .fold(Duration.zero, (prev, element) => prev + element);
  }

  Future<void> seek(Duration position) async {
    int targetAyahIndex = 0;
    Duration accumulatedDuration = Duration.zero;

    for (int i = 0; i < ayahDurations.length; i++) {
      Duration nextDuration = accumulatedDuration + ayahDurations[i];
      if (position < nextDuration) {
        targetAyahIndex = i;
        break;
      }
      accumulatedDuration = nextDuration;
    }

    Duration positionInAyah = position - accumulatedDuration;

    currentPosition.value = position;
    sliderPosition.value = position.inSeconds.toDouble();

    if (targetAyahIndex != currentAyahIndex) {
      currentAyahIndex = targetAyahIndex;
      await player.setAsset(ayahFiles[targetAyahIndex]);
      await player.seek(positionInAyah);
    } else {
      await player.seek(positionInAyah);
    }

    if (isPlaying.value) {
      await player.play();
    }
  }

  Future<void> _playAyah(int index) async {
    if (index >= ayahFiles.length || isStopped) return;

    try {
      isPlaying.value = true;
      await player.setAsset(ayahFiles[index]);
      await player.play();
      currentPosition.value = _getPreviousAyahsDuration();
      sliderPosition.value = currentPosition.value.inSeconds.toDouble();
    } catch (e) {
      print("Error playing Ayah: $e");
      isPlaying.value = false;
    }
  }

  Future<void> stopAudio() async {
    isStopped = true;
    isPlaying.value = false;
    await player.stop();
    await player.seek(Duration.zero);
    currentPosition.value = Duration.zero;
    sliderPosition.value = 0.0;
    currentAyahIndex = 0;
    await player.setAsset(ayahFiles[currentAyahIndex]);
  }

  Future<void> pauseAudio() async {
    if (!player.playing) return;
    await player.pause();
    isPlaying.value = false;
  }

  Future<void> playAudio() async {
    isStopped = false;

    if (currentPosition.value >= totalDuration.value) {
      /// 🔥 **অডিও শেষ হলে আবার প্রথম আয়াত থেকে শুরু করবে।**
      currentAyahIndex = 0;
      await _playAyah(0);
    } else {
      isPlaying.value = true;
      await player.play();
    }
  }

  Future<void> nextAyah() async {
    if (currentAyahIndex < ayahFiles.length - 1) {
      currentAyahIndex++;
      if (!isPlaying.value) {
        await _playAyah(currentAyahIndex);
      } else {
        await player.play();
      }
    }
  }

  Future<void> previousAyah() async {
    if (currentAyahIndex > 0) {
      currentAyahIndex--;
      await _playAyah(currentAyahIndex);
    }
  }

  @override
  void onClose() {
    _positionSubscription?.cancel();
    _playerStateSubscription?.cancel();
    player.dispose();
    super.onClose();
  }
}
