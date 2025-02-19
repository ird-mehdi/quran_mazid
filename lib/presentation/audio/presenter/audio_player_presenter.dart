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
  int currentAyahIndex = 0;
  List<Duration> ayahDurations = [];

  bool isStopped = false;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  @override
  void onInit() {
    super.onInit();
    _initStreams();
    loadSurah("114");
  }

  void _initStreams() {
    _positionSubscription = player.positionStream.listen((position) {
      if (!isStopped) {
        Duration previousDuration = _getPreviousAyahsDuration();
        currentPosition.value = previousDuration + position;
        sliderPosition.value = currentPosition.value.inSeconds.toDouble();
      }
    });

    _playerStateSubscription = player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed && !isStopped) {
        if (currentAyahIndex < ayahFiles.length - 1) {
          currentAyahIndex++;
          _playAyah(currentAyahIndex);
        } else {
          // Reset when all ayahs are finished
          isStopped = true;
          isPlaying.value = false;
          currentAyahIndex = 0;
          currentPosition.value = Duration.zero;
          sliderPosition.value = 0.0; // Reset slider position
          player.stop();
          player.seek(Duration.zero); // Ensure position is reset
          _playAyah(0); // Preload first ayah
        }
      }
    });
  }

  Future<void> loadSurah(String surahIndex) async {
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

    // Just preload the first ayah without playing
    await player.setAsset(ayahFiles[currentAyahIndex]);
    await player.pause();
  }

  Duration _getPreviousAyahsDuration() {
    Duration total = Duration.zero;
    for (int i = 0; i < currentAyahIndex; i++) {
      total += ayahDurations[i];
    }
    return total;
  }

  Future<void> seek(Duration position) async {
    int targetAyahIndex = 0;
    Duration accumulatedDuration = Duration.zero;

    // Find target ayah without updating position yet
    for (int i = 0; i < ayahDurations.length; i++) {
      Duration nextDuration = accumulatedDuration + ayahDurations[i];
      if (position >= nextDuration) {
        accumulatedDuration = nextDuration;
      } else {
        targetAyahIndex = i;
        break;
      }
    }

    Duration positionInAyah = position - accumulatedDuration;

    // Only update UI after we've calculated everything
    currentPosition.value = position;
    sliderPosition.value = position.inSeconds.toDouble();

    if (targetAyahIndex != currentAyahIndex) {
      currentAyahIndex = targetAyahIndex;
      await player.setAsset(ayahFiles[targetAyahIndex]);
      if (isPlaying.value) {
        await player.play();
      }
    }
    await player.seek(positionInAyah);
  }

  Future<void> _playAyah(int index) async {
    if (index >= ayahFiles.length) {
      isPlaying.value = false;
      return;
    }

    if (isStopped) {
      return; // Don't play if stopped
    }

    try {
      // Set playing state before loading to show correct icon
      isPlaying.value = true;

      await player.setAsset(ayahFiles[index]);
      await player.play();

      // Update player state based on actual playback
      isPlaying.value = player.playing;
    } catch (e) {
      print("Error loading audio: $e");
      isPlaying.value = false;
    }
  }

  Future<void> stopAudio() async {
    isStopped = true;
    isPlaying.value = false;
    await player.stop();
    await player.seek(Duration.zero); // Add explicit seek to start
    currentPosition.value = Duration.zero;
    currentAyahIndex = 0;
    // Preload first ayah after stopping
    await player.setAsset(ayahFiles[currentAyahIndex]);
  }

  Future<void> pauseAudio() async {
    if (!player.playing) return;
    await player.pause();
    isPlaying.value = false;
  }

  Future<void> playAudio() async {
    if (player.playing) return;

    isStopped = false;

    if (currentPosition.value >= totalDuration.value) {
      // If at end, start from beginning
      currentPosition.value = Duration.zero;
      sliderPosition.value = 0.0;
      currentAyahIndex = 0;
      await _playAyah(0);
    } else {
      // Resume from current position
      isPlaying.value = true;
      await player.play();
    }
  }

  Future<void> nextAyah() async {
    if (currentAyahIndex < ayahFiles.length - 1) {
      currentAyahIndex++;
      await _playAyah(currentAyahIndex);
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
