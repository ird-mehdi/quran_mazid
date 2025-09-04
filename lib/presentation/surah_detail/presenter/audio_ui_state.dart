import 'package:quran_mazid_app/core/base/base_ui_state.dart';

class AudioUiState extends BaseUiState {
  const AudioUiState({
    required super.isLoading,
    required super.userMessage,
    this.isPlaying,
    this.currentPosition,
    this.totalDuration,
    this.sliderPosition,
    this.ayahFiles,
    this.ayahDurations,
    this.currentAyahIndex,
    this.isStopped,
  });

  factory AudioUiState.empty() => AudioUiState(
    isLoading: false,
    userMessage: '',
    isPlaying: false,
    currentPosition: Duration.zero,
    totalDuration: Duration.zero,
    sliderPosition: 0.0,
    ayahFiles: [],
    ayahDurations: [],
    currentAyahIndex: 0,
    isStopped: false,
  );

  final bool? isPlaying;
  final Duration? currentPosition;
  final Duration? totalDuration;
  final double? sliderPosition;
  final List<String>? ayahFiles;
  final List<Duration>? ayahDurations;
  final int? currentAyahIndex;
  final bool? isStopped;

  @override
  List<Object?> get props => [
    isLoading,
    userMessage,
    isPlaying,
    currentPosition,
    totalDuration,
    sliderPosition,
    ayahFiles,
    ayahDurations,
    currentAyahIndex,
    isStopped,
  ];

  AudioUiState copyWith({
    bool? isLoading,
    String? userMessage,
    bool? isPlaying,
    Duration? currentPosition,
    Duration? totalDuration,
    double? sliderPosition,
    List<String>? ayahFiles,
    List<Duration>? ayahDurations,
    int? currentAyahIndex,
    bool? isStopped,
  }) => AudioUiState(
    isLoading: isLoading ?? this.isLoading,
    userMessage: userMessage ?? this.userMessage,
    isPlaying: isPlaying ?? this.isPlaying,
    currentPosition: currentPosition ?? this.currentPosition,
    totalDuration: totalDuration ?? this.totalDuration,
    sliderPosition: sliderPosition ?? this.sliderPosition,
    ayahFiles: ayahFiles ?? this.ayahFiles,
    ayahDurations: ayahDurations ?? this.ayahDurations,
    currentAyahIndex: currentAyahIndex ?? this.currentAyahIndex,
    isStopped: isStopped ?? this.isStopped,
  );
}
