class SurhaNameEntity {
  final int number;
  final String name;
  final String location;
  final int verses;
  final String arabicName;

  SurhaNameEntity({
    required this.number,
    required this.name,
    required this.location,
    required this.verses,
    required this.arabicName,
  });

  @override
  String toString() {
    return 'SurhaNameEntity(number: $number, name: $name, location: $location, verses: $verses, arabicName: $arabicName)';
  }
}
