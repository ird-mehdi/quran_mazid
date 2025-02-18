import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:quran_mazid_app/core/config/env_config.dart';
import 'package:quran_mazid_app/core/utils/future_utils.dart';

LazyDatabase loadDatabase() => LazyDatabase(() => _openConnection());

Future<bool> isDatabaseExists() async {
  final bool? isDatabaseExists = await catchAndReturnFuture(
    getApplicationDocumentsDirectory().then(
      (value) => File(p.join(value.path, EnvConfig.dbName)).existsSync(),
    ),
  );
  return isDatabaseExists ?? false;
}

Future<void> deleteDatabase() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, EnvConfig.dbName));
  if (file.existsSync()) {
    file.deleteSync();
  }
}

Future<QueryExecutor> _openConnection() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, EnvConfig.dbName));
  if (!file.existsSync()) {
    final ByteData data = await rootBundle.load(EnvConfig.dbAssetPath);
    final List<int> bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
    await file.writeAsBytes(bytes);
  }
  return NativeDatabase.createInBackground(file);
}
