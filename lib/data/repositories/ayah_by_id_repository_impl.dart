import 'package:quran_mazid_app/data/mappers/surah_mapper.dart';
import 'package:quran_mazid_app/data/service/database/database_service.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';
import 'package:quran_mazid_app/domain/repositories/ayah_by_id_repository.dart';

class AyahByIdRepositoryImpl extends AyahByIdRepository {
  AyahByIdRepositoryImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  Future<List<SurhaEntity>> getAyahById(int surahId) async {
    try {
      final surah = await _databaseService.getAyahById(surahId);
      return surah.map((e) => e.toSurhaEntity()).toList();
    } catch (e) {
      return [];
    }
  }
}
