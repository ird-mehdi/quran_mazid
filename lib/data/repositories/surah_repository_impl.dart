import 'package:quran_mazid_app/data/mappers/surah_mapper.dart';
import 'package:quran_mazid_app/data/service/database/database_service.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';
import 'package:quran_mazid_app/domain/repositories/surah_repository.dart';

class SurahRepositoryImpl extends SurahRepository {
  SurahRepositoryImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  Future<List<SurhaEntity>> getSurahList() async {
    final surahList = await _databaseService.getAllSurahs();
    return surahList.toSurhaEntityList();
  }
}
