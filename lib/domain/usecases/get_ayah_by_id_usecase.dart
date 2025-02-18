import 'package:fpdart/fpdart.dart';
import 'package:quran_mazid_app/core/base/base_use_case.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';
import 'package:quran_mazid_app/domain/repositories/ayah_by_id_repository.dart';

class GetAyahByIdUsecase extends BaseUseCase<List<SurhaEntity>> {
  GetAyahByIdUsecase(super.errorMessageHandler, this._ayahByIdRepository);

  final AyahByIdRepository _ayahByIdRepository;

  Future<Either<String, List<SurhaEntity>>> execute(int surahId) async {
    return await mapResultToEither(
      () => _ayahByIdRepository.getAyahById(surahId),
    );
  }
}
