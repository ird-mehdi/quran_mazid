import 'package:quran_mazid_app/core/base/base_ui_state.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';

class SurahDetailUiState extends BaseUiState {
  const SurahDetailUiState({
    required super.isLoading,
    required super.userMessage,
    this.surahList,
  });

  factory SurahDetailUiState.empty() =>
      SurahDetailUiState(isLoading: false, userMessage: '', surahList: []);

  final List<SurhaEntity>? surahList;

  @override
  List<Object?> get props => [isLoading, userMessage, surahList];

  SurahDetailUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<SurhaEntity>? surahList,
  }) => SurahDetailUiState(
    isLoading: isLoading ?? this.isLoading,
    userMessage: userMessage ?? this.userMessage,
    surahList: surahList ?? this.surahList,
  );
}
