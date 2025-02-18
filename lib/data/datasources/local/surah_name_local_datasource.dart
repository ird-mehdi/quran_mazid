import 'package:quran_mazid_app/data/mappers/surah_name_mapper.dart';
import 'package:quran_mazid_app/data/service/database/database_service.dart';
import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';

class SurahNameLocalDatasource {
  SurahNameLocalDatasource(this.databaseService);

  final DatabaseService databaseService;

  Future<List<SurhaNameEntity>> getSurahNames() async {
    final surahNames = await databaseService.getAllSurahNames();
    return surahNames.map((e) => e.toSurhaNameEntity()).toList();
  }
}
