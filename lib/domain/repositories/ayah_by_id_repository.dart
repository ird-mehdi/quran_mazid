import 'package:quran_mazid_app/domain/entities/surha_entity.dart';

abstract class AyahByIdRepository {
  Future<List<SurhaEntity>> getAyahById(int surahId);
}
