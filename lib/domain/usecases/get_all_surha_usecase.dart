import 'package:fpdart/fpdart.dart';
import 'package:quran_mazid_app/core/base/base_use_case.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';
import 'package:quran_mazid_app/domain/repositories/surah_repository.dart';

class GetAllSurhaUsecase extends BaseUseCase<List<SurhaEntity>> {
  GetAllSurhaUsecase(super.errorMessageHandler, this._surahRepository);

  final SurahRepository _surahRepository;

  Future<Either<String, List<SurhaEntity>>> execute() async {
    return await mapResultToEither(() => _surahRepository.getSurahList());
  }
}
