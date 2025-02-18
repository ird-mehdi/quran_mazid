import 'package:equatable/equatable.dart';

class SurhaEntity extends Equatable {
  final int id;
  final int number;
  final String ayah;
  final int numberInSurah;
  final int page;
  final int surahId;
  final int hizbId;
  final int juzId;
  final bool sajda;

  const SurhaEntity({
    required this.id,
    required this.number,
    required this.ayah,
    required this.numberInSurah,
    required this.page,
    required this.surahId,
    required this.hizbId,
    required this.juzId,
    required this.sajda,
  });

  @override
  List<Object?> get props => [
    id,
    number,
    ayah,
    numberInSurah,
    page,
    surahId,
    hizbId,
    juzId,
    sajda,
  ];
}
