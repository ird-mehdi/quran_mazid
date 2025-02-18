import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';

abstract class SurahNameRepository {
  Future<List<SurhaNameEntity>> getSurahNameList();
}
