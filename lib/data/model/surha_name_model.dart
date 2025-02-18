import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';

class SurhaNameModel extends SurhaNameEntity {
  SurhaNameModel({
    required super.number,
    required super.name,
    required super.location,
    required super.verses,
    required super.arabicName,
  });

  factory SurhaNameModel.fromJson(Map<String, dynamic> json) {
    return SurhaNameModel(
      number: int.tryParse(json['number']?.toString() ?? '') ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      location: json['location'] as String? ?? 'Unknown',
      verses: int.tryParse(json['verses']?.toString() ?? '') ?? 0,
      arabicName: json['arabicName'] as String? ?? 'Unknown',
    );
  }
}
