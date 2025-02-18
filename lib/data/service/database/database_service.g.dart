// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// ignore_for_file: type=lint
class $QuranMainTable extends QuranMain
    with TableInfo<$QuranMainTable, QuranMainData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuranMainTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _suraIdMeta = const VerificationMeta('suraId');
  @override
  late final GeneratedColumn<int> suraId = GeneratedColumn<int>(
    'sura_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ayahIdMeta = const VerificationMeta('ayahId');
  @override
  late final GeneratedColumn<int> ayahId = GeneratedColumn<int>(
    'ayah_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paraMeta = const VerificationMeta('para');
  @override
  late final GeneratedColumn<int> para = GeneratedColumn<int>(
    'para',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hijbMeta = const VerificationMeta('hijb');
  @override
  late final GeneratedColumn<String> hijb = GeneratedColumn<String>(
    'hijb',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
    'page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uthmaniMeta = const VerificationMeta(
    'uthmani',
  );
  @override
  late final GeneratedColumn<String> uthmani = GeneratedColumn<String>(
    'uthmani',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cleanMeta = const VerificationMeta('clean');
  @override
  late final GeneratedColumn<String> clean = GeneratedColumn<String>(
    'clean',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qcfMeta = const VerificationMeta('qcf');
  @override
  late final GeneratedColumn<String> qcf = GeneratedColumn<String>(
    'qcf',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fontsMeta = const VerificationMeta('fonts');
  @override
  late final GeneratedColumn<String> fonts = GeneratedColumn<String>(
    'fonts',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tafsirKathirMeta = const VerificationMeta(
    'tafsirKathir',
  );
  @override
  late final GeneratedColumn<int> tafsirKathir = GeneratedColumn<int>(
    'tafsir_kathir',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tafsirFmazidMeta = const VerificationMeta(
    'tafsirFmazid',
  );
  @override
  late final GeneratedColumn<int> tafsirFmazid = GeneratedColumn<int>(
    'tafsir_fmazid',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tafsirKathirMujiborMeta =
      const VerificationMeta('tafsirKathirMujibor');
  @override
  late final GeneratedColumn<int> tafsirKathirMujibor = GeneratedColumn<int>(
    'tafsir_kathir_mujibor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    suraId,
    ayahId,
    para,
    hijb,
    page,
    uthmani,
    clean,
    qcf,
    fonts,
    tafsirKathir,
    tafsirFmazid,
    tafsirKathirMujibor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quran_main';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuranMainData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sura_id')) {
      context.handle(
        _suraIdMeta,
        suraId.isAcceptableOrUnknown(data['sura_id']!, _suraIdMeta),
      );
    } else if (isInserting) {
      context.missing(_suraIdMeta);
    }
    if (data.containsKey('ayah_id')) {
      context.handle(
        _ayahIdMeta,
        ayahId.isAcceptableOrUnknown(data['ayah_id']!, _ayahIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahIdMeta);
    }
    if (data.containsKey('para')) {
      context.handle(
        _paraMeta,
        para.isAcceptableOrUnknown(data['para']!, _paraMeta),
      );
    } else if (isInserting) {
      context.missing(_paraMeta);
    }
    if (data.containsKey('hijb')) {
      context.handle(
        _hijbMeta,
        hijb.isAcceptableOrUnknown(data['hijb']!, _hijbMeta),
      );
    }
    if (data.containsKey('page')) {
      context.handle(
        _pageMeta,
        page.isAcceptableOrUnknown(data['page']!, _pageMeta),
      );
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('uthmani')) {
      context.handle(
        _uthmaniMeta,
        uthmani.isAcceptableOrUnknown(data['uthmani']!, _uthmaniMeta),
      );
    }
    if (data.containsKey('clean')) {
      context.handle(
        _cleanMeta,
        clean.isAcceptableOrUnknown(data['clean']!, _cleanMeta),
      );
    }
    if (data.containsKey('qcf')) {
      context.handle(
        _qcfMeta,
        qcf.isAcceptableOrUnknown(data['qcf']!, _qcfMeta),
      );
    }
    if (data.containsKey('fonts')) {
      context.handle(
        _fontsMeta,
        fonts.isAcceptableOrUnknown(data['fonts']!, _fontsMeta),
      );
    }
    if (data.containsKey('tafsir_kathir')) {
      context.handle(
        _tafsirKathirMeta,
        tafsirKathir.isAcceptableOrUnknown(
          data['tafsir_kathir']!,
          _tafsirKathirMeta,
        ),
      );
    }
    if (data.containsKey('tafsir_fmazid')) {
      context.handle(
        _tafsirFmazidMeta,
        tafsirFmazid.isAcceptableOrUnknown(
          data['tafsir_fmazid']!,
          _tafsirFmazidMeta,
        ),
      );
    }
    if (data.containsKey('tafsir_kathir_mujibor')) {
      context.handle(
        _tafsirKathirMujiborMeta,
        tafsirKathirMujibor.isAcceptableOrUnknown(
          data['tafsir_kathir_mujibor']!,
          _tafsirKathirMujiborMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuranMainData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuranMainData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      suraId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sura_id'],
          )!,
      ayahId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ayah_id'],
          )!,
      para:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}para'],
          )!,
      hijb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hijb'],
      ),
      page:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}page'],
          )!,
      uthmani: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uthmani'],
      ),
      clean: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}clean'],
      ),
      qcf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}qcf'],
      ),
      fonts: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fonts'],
      ),
      tafsirKathir: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tafsir_kathir'],
      ),
      tafsirFmazid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tafsir_fmazid'],
      ),
      tafsirKathirMujibor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tafsir_kathir_mujibor'],
      ),
    );
  }

  @override
  $QuranMainTable createAlias(String alias) {
    return $QuranMainTable(attachedDatabase, alias);
  }
}

class QuranMainData extends DataClass implements Insertable<QuranMainData> {
  final int id;
  final int suraId;
  final int ayahId;
  final int para;
  final String? hijb;
  final int page;
  final String? uthmani;
  final String? clean;
  final String? qcf;
  final String? fonts;
  final int? tafsirKathir;
  final int? tafsirFmazid;
  final int? tafsirKathirMujibor;
  const QuranMainData({
    required this.id,
    required this.suraId,
    required this.ayahId,
    required this.para,
    this.hijb,
    required this.page,
    this.uthmani,
    this.clean,
    this.qcf,
    this.fonts,
    this.tafsirKathir,
    this.tafsirFmazid,
    this.tafsirKathirMujibor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sura_id'] = Variable<int>(suraId);
    map['ayah_id'] = Variable<int>(ayahId);
    map['para'] = Variable<int>(para);
    if (!nullToAbsent || hijb != null) {
      map['hijb'] = Variable<String>(hijb);
    }
    map['page'] = Variable<int>(page);
    if (!nullToAbsent || uthmani != null) {
      map['uthmani'] = Variable<String>(uthmani);
    }
    if (!nullToAbsent || clean != null) {
      map['clean'] = Variable<String>(clean);
    }
    if (!nullToAbsent || qcf != null) {
      map['qcf'] = Variable<String>(qcf);
    }
    if (!nullToAbsent || fonts != null) {
      map['fonts'] = Variable<String>(fonts);
    }
    if (!nullToAbsent || tafsirKathir != null) {
      map['tafsir_kathir'] = Variable<int>(tafsirKathir);
    }
    if (!nullToAbsent || tafsirFmazid != null) {
      map['tafsir_fmazid'] = Variable<int>(tafsirFmazid);
    }
    if (!nullToAbsent || tafsirKathirMujibor != null) {
      map['tafsir_kathir_mujibor'] = Variable<int>(tafsirKathirMujibor);
    }
    return map;
  }

  QuranMainCompanion toCompanion(bool nullToAbsent) {
    return QuranMainCompanion(
      id: Value(id),
      suraId: Value(suraId),
      ayahId: Value(ayahId),
      para: Value(para),
      hijb: hijb == null && nullToAbsent ? const Value.absent() : Value(hijb),
      page: Value(page),
      uthmani:
          uthmani == null && nullToAbsent
              ? const Value.absent()
              : Value(uthmani),
      clean:
          clean == null && nullToAbsent ? const Value.absent() : Value(clean),
      qcf: qcf == null && nullToAbsent ? const Value.absent() : Value(qcf),
      fonts:
          fonts == null && nullToAbsent ? const Value.absent() : Value(fonts),
      tafsirKathir:
          tafsirKathir == null && nullToAbsent
              ? const Value.absent()
              : Value(tafsirKathir),
      tafsirFmazid:
          tafsirFmazid == null && nullToAbsent
              ? const Value.absent()
              : Value(tafsirFmazid),
      tafsirKathirMujibor:
          tafsirKathirMujibor == null && nullToAbsent
              ? const Value.absent()
              : Value(tafsirKathirMujibor),
    );
  }

  factory QuranMainData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuranMainData(
      id: serializer.fromJson<int>(json['id']),
      suraId: serializer.fromJson<int>(json['suraId']),
      ayahId: serializer.fromJson<int>(json['ayahId']),
      para: serializer.fromJson<int>(json['para']),
      hijb: serializer.fromJson<String?>(json['hijb']),
      page: serializer.fromJson<int>(json['page']),
      uthmani: serializer.fromJson<String?>(json['uthmani']),
      clean: serializer.fromJson<String?>(json['clean']),
      qcf: serializer.fromJson<String?>(json['qcf']),
      fonts: serializer.fromJson<String?>(json['fonts']),
      tafsirKathir: serializer.fromJson<int?>(json['tafsirKathir']),
      tafsirFmazid: serializer.fromJson<int?>(json['tafsirFmazid']),
      tafsirKathirMujibor: serializer.fromJson<int?>(
        json['tafsirKathirMujibor'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'suraId': serializer.toJson<int>(suraId),
      'ayahId': serializer.toJson<int>(ayahId),
      'para': serializer.toJson<int>(para),
      'hijb': serializer.toJson<String?>(hijb),
      'page': serializer.toJson<int>(page),
      'uthmani': serializer.toJson<String?>(uthmani),
      'clean': serializer.toJson<String?>(clean),
      'qcf': serializer.toJson<String?>(qcf),
      'fonts': serializer.toJson<String?>(fonts),
      'tafsirKathir': serializer.toJson<int?>(tafsirKathir),
      'tafsirFmazid': serializer.toJson<int?>(tafsirFmazid),
      'tafsirKathirMujibor': serializer.toJson<int?>(tafsirKathirMujibor),
    };
  }

  QuranMainData copyWith({
    int? id,
    int? suraId,
    int? ayahId,
    int? para,
    Value<String?> hijb = const Value.absent(),
    int? page,
    Value<String?> uthmani = const Value.absent(),
    Value<String?> clean = const Value.absent(),
    Value<String?> qcf = const Value.absent(),
    Value<String?> fonts = const Value.absent(),
    Value<int?> tafsirKathir = const Value.absent(),
    Value<int?> tafsirFmazid = const Value.absent(),
    Value<int?> tafsirKathirMujibor = const Value.absent(),
  }) => QuranMainData(
    id: id ?? this.id,
    suraId: suraId ?? this.suraId,
    ayahId: ayahId ?? this.ayahId,
    para: para ?? this.para,
    hijb: hijb.present ? hijb.value : this.hijb,
    page: page ?? this.page,
    uthmani: uthmani.present ? uthmani.value : this.uthmani,
    clean: clean.present ? clean.value : this.clean,
    qcf: qcf.present ? qcf.value : this.qcf,
    fonts: fonts.present ? fonts.value : this.fonts,
    tafsirKathir: tafsirKathir.present ? tafsirKathir.value : this.tafsirKathir,
    tafsirFmazid: tafsirFmazid.present ? tafsirFmazid.value : this.tafsirFmazid,
    tafsirKathirMujibor:
        tafsirKathirMujibor.present
            ? tafsirKathirMujibor.value
            : this.tafsirKathirMujibor,
  );
  QuranMainData copyWithCompanion(QuranMainCompanion data) {
    return QuranMainData(
      id: data.id.present ? data.id.value : this.id,
      suraId: data.suraId.present ? data.suraId.value : this.suraId,
      ayahId: data.ayahId.present ? data.ayahId.value : this.ayahId,
      para: data.para.present ? data.para.value : this.para,
      hijb: data.hijb.present ? data.hijb.value : this.hijb,
      page: data.page.present ? data.page.value : this.page,
      uthmani: data.uthmani.present ? data.uthmani.value : this.uthmani,
      clean: data.clean.present ? data.clean.value : this.clean,
      qcf: data.qcf.present ? data.qcf.value : this.qcf,
      fonts: data.fonts.present ? data.fonts.value : this.fonts,
      tafsirKathir:
          data.tafsirKathir.present
              ? data.tafsirKathir.value
              : this.tafsirKathir,
      tafsirFmazid:
          data.tafsirFmazid.present
              ? data.tafsirFmazid.value
              : this.tafsirFmazid,
      tafsirKathirMujibor:
          data.tafsirKathirMujibor.present
              ? data.tafsirKathirMujibor.value
              : this.tafsirKathirMujibor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuranMainData(')
          ..write('id: $id, ')
          ..write('suraId: $suraId, ')
          ..write('ayahId: $ayahId, ')
          ..write('para: $para, ')
          ..write('hijb: $hijb, ')
          ..write('page: $page, ')
          ..write('uthmani: $uthmani, ')
          ..write('clean: $clean, ')
          ..write('qcf: $qcf, ')
          ..write('fonts: $fonts, ')
          ..write('tafsirKathir: $tafsirKathir, ')
          ..write('tafsirFmazid: $tafsirFmazid, ')
          ..write('tafsirKathirMujibor: $tafsirKathirMujibor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    suraId,
    ayahId,
    para,
    hijb,
    page,
    uthmani,
    clean,
    qcf,
    fonts,
    tafsirKathir,
    tafsirFmazid,
    tafsirKathirMujibor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuranMainData &&
          other.id == this.id &&
          other.suraId == this.suraId &&
          other.ayahId == this.ayahId &&
          other.para == this.para &&
          other.hijb == this.hijb &&
          other.page == this.page &&
          other.uthmani == this.uthmani &&
          other.clean == this.clean &&
          other.qcf == this.qcf &&
          other.fonts == this.fonts &&
          other.tafsirKathir == this.tafsirKathir &&
          other.tafsirFmazid == this.tafsirFmazid &&
          other.tafsirKathirMujibor == this.tafsirKathirMujibor);
}

class QuranMainCompanion extends UpdateCompanion<QuranMainData> {
  final Value<int> id;
  final Value<int> suraId;
  final Value<int> ayahId;
  final Value<int> para;
  final Value<String?> hijb;
  final Value<int> page;
  final Value<String?> uthmani;
  final Value<String?> clean;
  final Value<String?> qcf;
  final Value<String?> fonts;
  final Value<int?> tafsirKathir;
  final Value<int?> tafsirFmazid;
  final Value<int?> tafsirKathirMujibor;
  const QuranMainCompanion({
    this.id = const Value.absent(),
    this.suraId = const Value.absent(),
    this.ayahId = const Value.absent(),
    this.para = const Value.absent(),
    this.hijb = const Value.absent(),
    this.page = const Value.absent(),
    this.uthmani = const Value.absent(),
    this.clean = const Value.absent(),
    this.qcf = const Value.absent(),
    this.fonts = const Value.absent(),
    this.tafsirKathir = const Value.absent(),
    this.tafsirFmazid = const Value.absent(),
    this.tafsirKathirMujibor = const Value.absent(),
  });
  QuranMainCompanion.insert({
    this.id = const Value.absent(),
    required int suraId,
    required int ayahId,
    required int para,
    this.hijb = const Value.absent(),
    required int page,
    this.uthmani = const Value.absent(),
    this.clean = const Value.absent(),
    this.qcf = const Value.absent(),
    this.fonts = const Value.absent(),
    this.tafsirKathir = const Value.absent(),
    this.tafsirFmazid = const Value.absent(),
    this.tafsirKathirMujibor = const Value.absent(),
  }) : suraId = Value(suraId),
       ayahId = Value(ayahId),
       para = Value(para),
       page = Value(page);
  static Insertable<QuranMainData> custom({
    Expression<int>? id,
    Expression<int>? suraId,
    Expression<int>? ayahId,
    Expression<int>? para,
    Expression<String>? hijb,
    Expression<int>? page,
    Expression<String>? uthmani,
    Expression<String>? clean,
    Expression<String>? qcf,
    Expression<String>? fonts,
    Expression<int>? tafsirKathir,
    Expression<int>? tafsirFmazid,
    Expression<int>? tafsirKathirMujibor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (suraId != null) 'sura_id': suraId,
      if (ayahId != null) 'ayah_id': ayahId,
      if (para != null) 'para': para,
      if (hijb != null) 'hijb': hijb,
      if (page != null) 'page': page,
      if (uthmani != null) 'uthmani': uthmani,
      if (clean != null) 'clean': clean,
      if (qcf != null) 'qcf': qcf,
      if (fonts != null) 'fonts': fonts,
      if (tafsirKathir != null) 'tafsir_kathir': tafsirKathir,
      if (tafsirFmazid != null) 'tafsir_fmazid': tafsirFmazid,
      if (tafsirKathirMujibor != null)
        'tafsir_kathir_mujibor': tafsirKathirMujibor,
    });
  }

  QuranMainCompanion copyWith({
    Value<int>? id,
    Value<int>? suraId,
    Value<int>? ayahId,
    Value<int>? para,
    Value<String?>? hijb,
    Value<int>? page,
    Value<String?>? uthmani,
    Value<String?>? clean,
    Value<String?>? qcf,
    Value<String?>? fonts,
    Value<int?>? tafsirKathir,
    Value<int?>? tafsirFmazid,
    Value<int?>? tafsirKathirMujibor,
  }) {
    return QuranMainCompanion(
      id: id ?? this.id,
      suraId: suraId ?? this.suraId,
      ayahId: ayahId ?? this.ayahId,
      para: para ?? this.para,
      hijb: hijb ?? this.hijb,
      page: page ?? this.page,
      uthmani: uthmani ?? this.uthmani,
      clean: clean ?? this.clean,
      qcf: qcf ?? this.qcf,
      fonts: fonts ?? this.fonts,
      tafsirKathir: tafsirKathir ?? this.tafsirKathir,
      tafsirFmazid: tafsirFmazid ?? this.tafsirFmazid,
      tafsirKathirMujibor: tafsirKathirMujibor ?? this.tafsirKathirMujibor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (suraId.present) {
      map['sura_id'] = Variable<int>(suraId.value);
    }
    if (ayahId.present) {
      map['ayah_id'] = Variable<int>(ayahId.value);
    }
    if (para.present) {
      map['para'] = Variable<int>(para.value);
    }
    if (hijb.present) {
      map['hijb'] = Variable<String>(hijb.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (uthmani.present) {
      map['uthmani'] = Variable<String>(uthmani.value);
    }
    if (clean.present) {
      map['clean'] = Variable<String>(clean.value);
    }
    if (qcf.present) {
      map['qcf'] = Variable<String>(qcf.value);
    }
    if (fonts.present) {
      map['fonts'] = Variable<String>(fonts.value);
    }
    if (tafsirKathir.present) {
      map['tafsir_kathir'] = Variable<int>(tafsirKathir.value);
    }
    if (tafsirFmazid.present) {
      map['tafsir_fmazid'] = Variable<int>(tafsirFmazid.value);
    }
    if (tafsirKathirMujibor.present) {
      map['tafsir_kathir_mujibor'] = Variable<int>(tafsirKathirMujibor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuranMainCompanion(')
          ..write('id: $id, ')
          ..write('suraId: $suraId, ')
          ..write('ayahId: $ayahId, ')
          ..write('para: $para, ')
          ..write('hijb: $hijb, ')
          ..write('page: $page, ')
          ..write('uthmani: $uthmani, ')
          ..write('clean: $clean, ')
          ..write('qcf: $qcf, ')
          ..write('fonts: $fonts, ')
          ..write('tafsirKathir: $tafsirKathir, ')
          ..write('tafsirFmazid: $tafsirFmazid, ')
          ..write('tafsirKathirMujibor: $tafsirKathirMujibor')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseService extends GeneratedDatabase {
  _$DatabaseService(QueryExecutor e) : super(e);
  $DatabaseServiceManager get managers => $DatabaseServiceManager(this);
  late final $QuranMainTable quranMain = $QuranMainTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [quranMain];
}

typedef $$QuranMainTableCreateCompanionBuilder =
    QuranMainCompanion Function({
      Value<int> id,
      required int suraId,
      required int ayahId,
      required int para,
      Value<String?> hijb,
      required int page,
      Value<String?> uthmani,
      Value<String?> clean,
      Value<String?> qcf,
      Value<String?> fonts,
      Value<int?> tafsirKathir,
      Value<int?> tafsirFmazid,
      Value<int?> tafsirKathirMujibor,
    });
typedef $$QuranMainTableUpdateCompanionBuilder =
    QuranMainCompanion Function({
      Value<int> id,
      Value<int> suraId,
      Value<int> ayahId,
      Value<int> para,
      Value<String?> hijb,
      Value<int> page,
      Value<String?> uthmani,
      Value<String?> clean,
      Value<String?> qcf,
      Value<String?> fonts,
      Value<int?> tafsirKathir,
      Value<int?> tafsirFmazid,
      Value<int?> tafsirKathirMujibor,
    });

class $$QuranMainTableFilterComposer
    extends Composer<_$DatabaseService, $QuranMainTable> {
  $$QuranMainTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get suraId => $composableBuilder(
    column: $table.suraId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ayahId => $composableBuilder(
    column: $table.ayahId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get para => $composableBuilder(
    column: $table.para,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hijb => $composableBuilder(
    column: $table.hijb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uthmani => $composableBuilder(
    column: $table.uthmani,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clean => $composableBuilder(
    column: $table.clean,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qcf => $composableBuilder(
    column: $table.qcf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fonts => $composableBuilder(
    column: $table.fonts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tafsirKathir => $composableBuilder(
    column: $table.tafsirKathir,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tafsirFmazid => $composableBuilder(
    column: $table.tafsirFmazid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tafsirKathirMujibor => $composableBuilder(
    column: $table.tafsirKathirMujibor,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuranMainTableOrderingComposer
    extends Composer<_$DatabaseService, $QuranMainTable> {
  $$QuranMainTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get suraId => $composableBuilder(
    column: $table.suraId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ayahId => $composableBuilder(
    column: $table.ayahId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get para => $composableBuilder(
    column: $table.para,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hijb => $composableBuilder(
    column: $table.hijb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uthmani => $composableBuilder(
    column: $table.uthmani,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clean => $composableBuilder(
    column: $table.clean,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qcf => $composableBuilder(
    column: $table.qcf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fonts => $composableBuilder(
    column: $table.fonts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tafsirKathir => $composableBuilder(
    column: $table.tafsirKathir,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tafsirFmazid => $composableBuilder(
    column: $table.tafsirFmazid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tafsirKathirMujibor => $composableBuilder(
    column: $table.tafsirKathirMujibor,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuranMainTableAnnotationComposer
    extends Composer<_$DatabaseService, $QuranMainTable> {
  $$QuranMainTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get suraId =>
      $composableBuilder(column: $table.suraId, builder: (column) => column);

  GeneratedColumn<int> get ayahId =>
      $composableBuilder(column: $table.ayahId, builder: (column) => column);

  GeneratedColumn<int> get para =>
      $composableBuilder(column: $table.para, builder: (column) => column);

  GeneratedColumn<String> get hijb =>
      $composableBuilder(column: $table.hijb, builder: (column) => column);

  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<String> get uthmani =>
      $composableBuilder(column: $table.uthmani, builder: (column) => column);

  GeneratedColumn<String> get clean =>
      $composableBuilder(column: $table.clean, builder: (column) => column);

  GeneratedColumn<String> get qcf =>
      $composableBuilder(column: $table.qcf, builder: (column) => column);

  GeneratedColumn<String> get fonts =>
      $composableBuilder(column: $table.fonts, builder: (column) => column);

  GeneratedColumn<int> get tafsirKathir => $composableBuilder(
    column: $table.tafsirKathir,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tafsirFmazid => $composableBuilder(
    column: $table.tafsirFmazid,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tafsirKathirMujibor => $composableBuilder(
    column: $table.tafsirKathirMujibor,
    builder: (column) => column,
  );
}

class $$QuranMainTableTableManager
    extends
        RootTableManager<
          _$DatabaseService,
          $QuranMainTable,
          QuranMainData,
          $$QuranMainTableFilterComposer,
          $$QuranMainTableOrderingComposer,
          $$QuranMainTableAnnotationComposer,
          $$QuranMainTableCreateCompanionBuilder,
          $$QuranMainTableUpdateCompanionBuilder,
          (
            QuranMainData,
            BaseReferences<_$DatabaseService, $QuranMainTable, QuranMainData>,
          ),
          QuranMainData,
          PrefetchHooks Function()
        > {
  $$QuranMainTableTableManager(_$DatabaseService db, $QuranMainTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$QuranMainTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$QuranMainTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$QuranMainTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> suraId = const Value.absent(),
                Value<int> ayahId = const Value.absent(),
                Value<int> para = const Value.absent(),
                Value<String?> hijb = const Value.absent(),
                Value<int> page = const Value.absent(),
                Value<String?> uthmani = const Value.absent(),
                Value<String?> clean = const Value.absent(),
                Value<String?> qcf = const Value.absent(),
                Value<String?> fonts = const Value.absent(),
                Value<int?> tafsirKathir = const Value.absent(),
                Value<int?> tafsirFmazid = const Value.absent(),
                Value<int?> tafsirKathirMujibor = const Value.absent(),
              }) => QuranMainCompanion(
                id: id,
                suraId: suraId,
                ayahId: ayahId,
                para: para,
                hijb: hijb,
                page: page,
                uthmani: uthmani,
                clean: clean,
                qcf: qcf,
                fonts: fonts,
                tafsirKathir: tafsirKathir,
                tafsirFmazid: tafsirFmazid,
                tafsirKathirMujibor: tafsirKathirMujibor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int suraId,
                required int ayahId,
                required int para,
                Value<String?> hijb = const Value.absent(),
                required int page,
                Value<String?> uthmani = const Value.absent(),
                Value<String?> clean = const Value.absent(),
                Value<String?> qcf = const Value.absent(),
                Value<String?> fonts = const Value.absent(),
                Value<int?> tafsirKathir = const Value.absent(),
                Value<int?> tafsirFmazid = const Value.absent(),
                Value<int?> tafsirKathirMujibor = const Value.absent(),
              }) => QuranMainCompanion.insert(
                id: id,
                suraId: suraId,
                ayahId: ayahId,
                para: para,
                hijb: hijb,
                page: page,
                uthmani: uthmani,
                clean: clean,
                qcf: qcf,
                fonts: fonts,
                tafsirKathir: tafsirKathir,
                tafsirFmazid: tafsirFmazid,
                tafsirKathirMujibor: tafsirKathirMujibor,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuranMainTableProcessedTableManager =
    ProcessedTableManager<
      _$DatabaseService,
      $QuranMainTable,
      QuranMainData,
      $$QuranMainTableFilterComposer,
      $$QuranMainTableOrderingComposer,
      $$QuranMainTableAnnotationComposer,
      $$QuranMainTableCreateCompanionBuilder,
      $$QuranMainTableUpdateCompanionBuilder,
      (
        QuranMainData,
        BaseReferences<_$DatabaseService, $QuranMainTable, QuranMainData>,
      ),
      QuranMainData,
      PrefetchHooks Function()
    >;

class $DatabaseServiceManager {
  final _$DatabaseService _db;
  $DatabaseServiceManager(this._db);
  $$QuranMainTableTableManager get quranMain =>
      $$QuranMainTableTableManager(_db, _db.quranMain);
}
