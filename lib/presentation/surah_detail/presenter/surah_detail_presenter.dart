import 'package:quran_mazid_app/core/base/base_presenter.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';
import 'package:quran_mazid_app/domain/usecases/get_ayah_by_id_usecase.dart';
import 'package:quran_mazid_app/presentation/surah_detail/presenter/surah_detail_ui_state.dart';

class SurahDetailPresenter extends BasePresenter<SurahDetailUiState> {
  final GetAyahByIdUsecase getAyahByIdUsecase;

  final Obs<SurahDetailUiState> _uiState = Obs(SurahDetailUiState.empty());

  SurahDetailUiState get currentUiState => _uiState.value;

  SurahDetailPresenter(this.getAyahByIdUsecase);

  Future<void> getAyahById(int surahNumber) async {
    await toggleLoading(loading: true);
    await parseDataFromEitherWithUserMessage<List<SurhaEntity>>(
      task: () => getAyahByIdUsecase.execute(surahNumber),
      onDataLoaded: (data) {
        _uiState.value = currentUiState.copyWith(surahList: data);
      },
    );
    await toggleLoading(loading: false);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    _uiState.value = currentUiState.copyWith(isLoading: loading);
  }

  @override
  Future<void> addUserMessage(String message) async {
    _uiState.value = currentUiState.copyWith(userMessage: message);
  }

  @override
  Future<void> showUserMessage({required String message}) async {
    _uiState.value = currentUiState.copyWith(userMessage: message);
  }
}
