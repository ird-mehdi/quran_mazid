import 'package:quran_mazid_app/core/base/base_ui_state.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';
import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';

class HomeUiState extends BaseUiState {
  const HomeUiState({
    required super.isLoading,
    super.userMessage,
    this.surahList,
    this.surahNameList,
  });

  final List<SurhaEntity>? surahList;
  final List<SurhaNameEntity>? surahNameList;

  factory HomeUiState.empty() => const HomeUiState(
    isLoading: false,
    userMessage: '',
    surahList: [],
    surahNameList: [],
  );

  @override
  List<Object?> get props => [isLoading, userMessage, surahList, surahNameList];

  HomeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<SurhaEntity>? surahList,
    List<SurhaNameEntity>? surahNameList,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      surahList: surahList ?? this.surahList,
      surahNameList: surahNameList ?? this.surahNameList,
    );
  }
}
