import 'package:quran_mazid_app/data/mappers/surah_name_mapper.dart';
import 'package:quran_mazid_app/data/service/database/database_service.dart';
import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';
import 'package:quran_mazid_app/domain/repositories/surah_name_repository.dart';

class SurahNameRepositoryImpl extends SurahNameRepository {
  SurahNameRepositoryImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  Future<List<SurhaNameEntity>> getSurahNameList() async {
    final surahNameList = await _databaseService.getAllSurahNames();
    return surahNameList.map((e) => e.toSurhaNameEntity()).toList();
  }
}
