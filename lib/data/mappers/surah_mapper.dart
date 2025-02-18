import 'package:quran_mazid_app/data/service/database/database_service.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';

extension SurahMapper on QuranMainData {
  SurhaEntity toSurhaEntity() {
    return SurhaEntity(
      id: id,
      number: suraId,
      ayah: uthmani ?? '',
      numberInSurah: ayahId,
      page: page,
      surahId: suraId,
      hizbId: int.tryParse(hijb ?? '0') ?? 0,
      juzId: para,
      sajda: false,
    );
  }
}

extension SurahListMapper on List<QuranMainData> {
  List<SurhaEntity> toSurhaEntityList() {
    return map((e) => e.toSurhaEntity()).toList();
  }
}
