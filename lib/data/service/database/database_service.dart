import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:quran_mazid_app/core/config/env_config.dart';
import 'package:quran_mazid_app/data/model/surha_name_model.dart';
import 'package:quran_mazid_app/data/service/database/database_loader.dart';
import 'package:quran_mazid_app/data/service/database/tables/surah_table.dart';
import 'package:quran_mazid_app/core/error/failure.dart';

part 'database_service.g.dart';

@DriftDatabase(tables: [QuranMain])
class DatabaseService extends _$DatabaseService {
  DatabaseService({QueryExecutor? executor})
    : super(executor ?? loadDatabase()) {
    _initDatabase().then((result) {
      result.fold(
        (failure) => throw Exception(failure.message),
        (success) => null,
      );
    });
  }

  @override
  int get schemaVersion => 1;

  Future<Either<Failure, bool>> _initDatabase() async {
    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      await File(p.join(dbFolder.path, EnvConfig.dbName)).exists();

      final count = await (select(quranMain)..limit(10)).get();

      if (count.isEmpty) {
        return const Left(Failure('Database is empty'));
      } else {
        return const Right(true);
      }
    } catch (e) {
      return Left(Failure('Database initialization error: ${e.toString()}'));
    }
  }

  Future<List<QuranMainData>> getAllSurahs() async {
    try {
      final query = select(quranMain)
        ..orderBy([(t) => OrderingTerm(expression: t.id)]);
      return await query.get();
    } catch (e) {
      return [];
    }
  }

  Future<List<SurhaNameModel>> getAllSurahNames() async {
    try {
      final response = await rootBundle.loadString('assets/json/suras.json');
      final List<dynamic> jsonData = jsonDecode(response) as List<dynamic>;
      return jsonData
          .map((e) => SurhaNameModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<QuranMainData>> getAyahById(int surahId) async {
    final query = select(quranMain)..where((t) => t.suraId.equals(surahId));
    return await query.get();
  }
}
