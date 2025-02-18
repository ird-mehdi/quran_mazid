import 'package:fpdart/fpdart.dart';
import 'package:quran_mazid_app/core/base/base_use_case.dart';
import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';
import 'package:quran_mazid_app/domain/repositories/surah_name_repository.dart';

class GetAllSurhaNameUsecase extends BaseUseCase<List<SurhaNameEntity>> {
  GetAllSurhaNameUsecase(super.errorMessageHandler, this._surahNameRepository);

  final SurahNameRepository _surahNameRepository;

  Future<Either<String, List<SurhaNameEntity>>> execute() async {
    return await mapResultToEither(
      () => _surahNameRepository.getSurahNameList(),
    );
  }
}
