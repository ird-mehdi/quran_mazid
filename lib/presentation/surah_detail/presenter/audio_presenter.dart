import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_mazid_app/core/base/base_presenter.dart';
import 'package:quran_mazid_app/presentation/surah_detail/presenter/audio_ui_state.dart';

class AudioController extends BasePresenter<AudioUiState> {
  final AudioPlayer player = AudioPlayer();

  final Obs<AudioUiState> _uiState = Obs(AudioUiState.empty());

  AudioUiState get currentUiState => _uiState.value;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  @override
  void onInit() {
    super.onInit();
    _initStreams();
    //loadSurah("001"); // Default Surah Load
  }

  void _initStreams() {
    _positionSubscription = player.positionStream.listen((position) {
      if (currentUiState.isStopped == false) {
        Duration previousDuration = _getPreviousAyahsDuration();
        _uiState.value = currentUiState.copyWith(
          currentPosition: previousDuration + position,
          sliderPosition: (previousDuration + position).inSeconds.toDouble(),
        );
      }
    });

    _playerStateSubscription = player.playerStateStream.listen((state) async {
      if (state.processingState == ProcessingState.completed &&
          currentUiState.isStopped == false) {
        final currentIndex = currentUiState.currentAyahIndex ?? 0;
        final files = currentUiState.ayahFiles ?? [];

        if (currentIndex < files.length - 1) {
          _uiState.value = currentUiState.copyWith(
            currentAyahIndex: currentIndex + 1,
          );
          await _playAyah(currentIndex + 1);
        } else {
          /// 🔥 **পুরো অডিও শেষ হলে আবার প্রথম আয়াত চালু হবে।**
          // currentAyahIndex = 0;
          // await _playAyah(currentAyahIndex);
          await stopAudio();
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

      List<String> newAyahFiles = [];
      List<Duration> newAyahDurations = [];
      Duration newTotalDuration = Duration.zero;

      for (var key in jsonData["verse"].keys) {
        String filePath =
            "assets/audio/$surahIndex/${jsonData["verse"][key]["file"]}";
        newAyahFiles.add(filePath);

        final duration = await player.setAsset(filePath);
        if (duration != null) {
          newAyahDurations.add(duration);
          newTotalDuration += duration;
        }
      }

      _uiState.value = currentUiState.copyWith(
        currentAyahIndex: 0,
        isPlaying: false,
        isStopped: false,
        currentPosition: Duration.zero,
        ayahFiles: newAyahFiles,
        ayahDurations: newAyahDurations,
        totalDuration: newTotalDuration,
      );

      if (newAyahFiles.isNotEmpty) {
        await player.setAsset(newAyahFiles[0]);
      }
    } catch (e) {
      print("Error loading Surah: $e");
    }
  }

  Duration _getPreviousAyahsDuration() {
    final ayahDurations = currentUiState.ayahDurations ?? [];
    final currentAyahIndex = currentUiState.currentAyahIndex ?? 0;
    return ayahDurations
        .sublist(0, currentAyahIndex)
        .fold(Duration.zero, (prev, element) => prev + element);
  }

  Future<void> seek(Duration position) async {
    int targetAyahIndex = 0;
    Duration accumulatedDuration = Duration.zero;
    final ayahDurations = currentUiState.ayahDurations ?? [];
    final ayahFiles = currentUiState.ayahFiles ?? [];
    final currentAyahIndex = currentUiState.currentAyahIndex ?? 0;

    for (int i = 0; i < ayahDurations.length; i++) {
      Duration nextDuration = accumulatedDuration + ayahDurations[i];
      if (position < nextDuration) {
        targetAyahIndex = i;
        break;
      }
      accumulatedDuration = nextDuration;
    }

    Duration positionInAyah = position - accumulatedDuration;

    _uiState.value = currentUiState.copyWith(
      currentPosition: position,
      sliderPosition: position.inSeconds.toDouble(),
    );

    if (targetAyahIndex != currentAyahIndex) {
      _uiState.value = currentUiState.copyWith(
        currentAyahIndex: targetAyahIndex,
      );
      await player.setAsset(ayahFiles[targetAyahIndex]);
      await player.seek(positionInAyah);
    } else {
      await player.seek(positionInAyah);
    }

    if (currentUiState.isPlaying == true) {
      await player.play();
    }
  }

  Future<void> _playAyah(int index) async {
    final ayahFiles = currentUiState.ayahFiles ?? [];
    final isStopped = currentUiState.isStopped ?? false;

    if (index >= ayahFiles.length || isStopped) return;

    try {
      _uiState.value = currentUiState.copyWith(isPlaying: true);
      await player.setAsset(ayahFiles[index]);
      await player.play();
      _uiState.value = currentUiState.copyWith(
        currentPosition: _getPreviousAyahsDuration(),
        sliderPosition: _getPreviousAyahsDuration().inSeconds.toDouble(),
      );
    } catch (e) {
      print("Error playing Ayah: $e");
      _uiState.value = currentUiState.copyWith(isPlaying: false);
    }
  }

  Future<void> stopAudio() async {
    _uiState.value = currentUiState.copyWith(isStopped: true);
    await player.stop();
    await player.seek(Duration.zero);

    final files = currentUiState.ayahFiles ?? [];

    _uiState.value = currentUiState.copyWith(
      currentPosition: Duration.zero,
      sliderPosition: 0.0,
      currentAyahIndex: 0,
    );

    if (files.isNotEmpty) {
      await player.setAsset(files[0]);
    }
  }

  Future<void> pauseAudio() async {
    if (player.playing == true) {
      await player.pause();
      _uiState.value = currentUiState.copyWith(isPlaying: false);
    }
  }

  Future<void> playAudio() async {
    final currentPosition = currentUiState.currentPosition ?? Duration.zero;
    final totalDuration = currentUiState.totalDuration ?? Duration.zero;

    if (currentPosition >= totalDuration) {
      /// 🔥 **অডিও শেষ হলে আবার প্রথম আয়াত থেকে শুরু করবে।**
      _uiState.value = currentUiState.copyWith(
        currentAyahIndex: 0,
        isStopped: false,
      );
      await _playAyah(0);
    } else {
      _uiState.value = currentUiState.copyWith(
        isPlaying: true,
        isStopped: false,
      );
      await player.play();
    }
  }

  Future<void> nextAyah() async {
    final currentAyahIndex = currentUiState.currentAyahIndex ?? 0;
    final isPlaying = currentUiState.isPlaying ?? false;
    final files = currentUiState.ayahFiles ?? [];

    if (currentAyahIndex < files.length - 1) {
      _uiState.value = currentUiState.copyWith(
        currentAyahIndex: currentAyahIndex + 1,
      );
      if (!isPlaying) {
        await _playAyah(currentAyahIndex + 1);
      } else {
        await player.setAsset(files[currentAyahIndex + 1]);
        await player.play();
      }
    }
  }

  Future<void> previousAyah() async {
    final currentAyahIndex = currentUiState.currentAyahIndex ?? 0;
    final isPlaying = currentUiState.isPlaying ?? false;
    final files = currentUiState.ayahFiles ?? [];

    if (currentAyahIndex > 0) {
      _uiState.value = currentUiState.copyWith(
        currentAyahIndex: currentAyahIndex - 1,
      );
      if (!isPlaying) {
        await _playAyah(currentAyahIndex - 1);
      } else {
        await player.setAsset(files[currentAyahIndex - 1]);
        await player.play();
      }
    }
  }

  @override
  void onClose() {
    _positionSubscription?.cancel();
    _playerStateSubscription?.cancel();
    player.dispose();
    super.onClose();
  }

  @override
  Future<void> addUserMessage(String message) {
    throw UnimplementedError();
  }

  @override
  Future<void> showUserMessage({required String message}) {
    throw UnimplementedError();
  }

  @override
  Future<void> toggleLoading({required bool loading}) {
    throw UnimplementedError();
  }
}
