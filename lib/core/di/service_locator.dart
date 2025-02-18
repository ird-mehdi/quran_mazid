import 'package:get_it/get_it.dart';
import 'package:quran_mazid_app/core/base/base_presenter.dart';
import 'package:quran_mazid_app/data/datasources/local/surah_name_local_datasource.dart';
import 'package:quran_mazid_app/data/datasources/local/surha_local_datasource.dart';
import 'package:quran_mazid_app/data/repositories/ayah_by_id_repository_impl.dart';
import 'package:quran_mazid_app/data/repositories/surah_name_repository_impl.dart';
import 'package:quran_mazid_app/data/repositories/surah_repository_impl.dart';
import 'package:quran_mazid_app/data/service/database/database_service.dart';
import 'package:quran_mazid_app/data/service/error_message_handler_impl.dart';
import 'package:quran_mazid_app/domain/repositories/ayah_by_id_repository.dart';
import 'package:quran_mazid_app/domain/repositories/surah_name_repository.dart';
import 'package:quran_mazid_app/domain/repositories/surah_repository.dart';
import 'package:quran_mazid_app/domain/service/error_message_handler.dart';
import 'package:quran_mazid_app/domain/usecases/get_all_surha_name_usecase.dart';
import 'package:quran_mazid_app/domain/usecases/get_all_surha_usecase.dart';
import 'package:quran_mazid_app/domain/usecases/get_ayah_by_id_usecase.dart';
import 'package:quran_mazid_app/presentation/home/presenter/home_presenter.dart';
import 'package:quran_mazid_app/presentation/surah_detail/presenter/surah_detail_presenter.dart';

final GetIt _serviceLocator = GetIt.instance;
T locator<T extends Object>() => _serviceLocator.get<T>();
void disposePresenter<T extends BasePresenter>() => disposePresenter<T>();

class ServiceLocator {
  ServiceLocator._();

  static Future<void> setUp({bool startOnlyService = false}) async {
    final ServiceLocator locator = ServiceLocator._();
    await locator._setUpService();
    if (startOnlyService) return;
    await locator._setUpDataSources();
    await locator._setUpRepositories();
    await locator._setUpUseCases();
    await locator._setUpPresenters();
  }

  Future<void> _setUpService() async {
    _serviceLocator.registerLazySingleton(() => DatabaseService());
    _serviceLocator.registerLazySingleton<ErrorMessageHandler>(
      () => ErrorMessageHandlerImpl(),
    );
  }

  Future<void> _setUpDataSources() async {
    _serviceLocator.registerLazySingleton(
      () => SurhaLocalDatasource(locator()),
    );
    _serviceLocator.registerLazySingleton(
      () => SurahNameLocalDatasource(locator()),
    );
  }

  Future<void> _setUpRepositories() async {
    _serviceLocator.registerLazySingleton<SurahRepository>(
      () => SurahRepositoryImpl(locator()),
    );
    _serviceLocator.registerLazySingleton<SurahNameRepository>(
      () => SurahNameRepositoryImpl(locator()),
    );
    _serviceLocator.registerLazySingleton<AyahByIdRepository>(
      () => AyahByIdRepositoryImpl(locator()),
    );
  }

  Future<void> _setUpUseCases() async {
    _serviceLocator.registerLazySingleton(
      () => GetAllSurhaUsecase(locator(), locator()),
    );
    _serviceLocator.registerLazySingleton(
      () => GetAllSurhaNameUsecase(locator(), locator()),
    );
    _serviceLocator.registerLazySingleton(
      () => GetAyahByIdUsecase(locator(), locator()),
    );
  }

  Future<void> _setUpPresenters() async {
    _serviceLocator.registerLazySingleton(
      () => HomePresenter(locator(), locator()),
    );
    _serviceLocator.registerLazySingleton(
      () => SurahDetailPresenter(locator()),
    );
  }
}
