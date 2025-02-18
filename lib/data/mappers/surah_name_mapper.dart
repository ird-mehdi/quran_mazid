import 'package:quran_mazid_app/data/model/surha_name_model.dart';
import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';

extension SurahNameMapper on SurhaNameModel {
  SurhaNameEntity toSurhaNameEntity() {
    return SurhaNameEntity(
      number: number,
      name: name,
      location: location,
      verses: verses,
      arabicName: arabicName,
    );
  }
}

extension SurahNameListMapper on List<SurhaNameModel> {
  List<SurhaNameEntity> toSurhaNameEntityList() {
    return map((e) => e.toSurhaNameEntity()).toList();
  }
}
