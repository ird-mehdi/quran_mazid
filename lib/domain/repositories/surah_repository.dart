import 'package:quran_mazid_app/domain/entities/surha_entity.dart';

abstract class SurahRepository {
  Future<List<SurhaEntity>> getSurahList();
}
