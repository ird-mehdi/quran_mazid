import 'package:quran_mazid_app/core/base/base_presenter.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';
import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';
import 'package:quran_mazid_app/domain/usecases/get_all_surha_name_usecase.dart';
import 'package:quran_mazid_app/domain/usecases/get_all_surha_usecase.dart';
import 'package:quran_mazid_app/presentation/home/presenter/home_ui_state.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  final GetAllSurhaUsecase getAllSurhaUsecase;
  final GetAllSurhaNameUsecase getAllSurhaNameUsecase;

  final Obs<HomeUiState> _uiState = Obs(HomeUiState.empty());

  HomeUiState get currentUiState => _uiState.value;

  HomePresenter(this.getAllSurhaUsecase, this.getAllSurhaNameUsecase);

  @override
  void onInit() {
    super.onInit();
    getSurahNameList();
  }

  Future<void> getSurahList() async {
    await parseDataFromEitherWithUserMessage<List<SurhaEntity>>(
      task: () => getAllSurhaUsecase.execute(),
      onDataLoaded: (data) {
        _uiState.value = currentUiState.copyWith(surahList: data);
      },
      showLoading: true,
    );
  }

  Future<void> getSurahNameList() async {
    await toggleLoading(loading: true);
    await parseDataFromEitherWithUserMessage<List<SurhaNameEntity>>(
      task: () => getAllSurhaNameUsecase.execute(),
      onDataLoaded: (data) {
        _uiState.value = currentUiState.copyWith(surahNameList: data);
      },
      showLoading: true,
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
