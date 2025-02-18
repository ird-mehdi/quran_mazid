import 'package:drift/drift.dart';

class QuranMain extends Table {
  IntColumn get id =>
      integer().autoIncrement()(); // Auto-incrementing primary key
  IntColumn get suraId => integer()();
  IntColumn get ayahId => integer()();
  IntColumn get para => integer()();
  TextColumn get hijb => text().nullable()(); // TEXT column (nullable)
  IntColumn get page => integer()();
  TextColumn get uthmani => text().nullable()();
  TextColumn get clean => text().nullable()();
  TextColumn get qcf => text().nullable()();
  TextColumn get fonts => text().nullable()();
  IntColumn get tafsirKathir => integer().nullable()();
  IntColumn get tafsirFmazid => integer().nullable()();
  IntColumn get tafsirKathirMujibor => integer().nullable()();
}
