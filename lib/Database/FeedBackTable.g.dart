// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FeedBackTable.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FeedBackData extends DataClass implements Insertable<FeedBackData> {
  final int id;
  final int clinicDoctorId;
  final int doctorId;
  final int patientVisitIid;
  final String option;
  final String question;
  final Medicationgenerated medication;
  final DateTime createdAt;
  final DateTime updatedAt;
  FeedBackData(
      {@required this.id,
      @required this.clinicDoctorId,
      @required this.doctorId,
      @required this.patientVisitIid,
      @required this.option,
      @required this.question,
      this.medication,
      this.createdAt,
      this.updatedAt});
  factory FeedBackData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return FeedBackData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      clinicDoctorId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}clinic_doctor_id']),
      doctorId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}doctor_id']),
      patientVisitIid: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}patient_visit_iid']),
      option:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}option']),
      question: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}question']),
      medication: $FeedBackTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}medication'])),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || clinicDoctorId != null) {
      map['clinic_doctor_id'] = Variable<int>(clinicDoctorId);
    }
    if (!nullToAbsent || doctorId != null) {
      map['doctor_id'] = Variable<int>(doctorId);
    }
    if (!nullToAbsent || patientVisitIid != null) {
      map['patient_visit_iid'] = Variable<int>(patientVisitIid);
    }
    if (!nullToAbsent || option != null) {
      map['option'] = Variable<String>(option);
    }
    if (!nullToAbsent || question != null) {
      map['question'] = Variable<String>(question);
    }
    if (!nullToAbsent || medication != null) {
      final converter = $FeedBackTable.$converter0;
      map['medication'] = Variable<String>(converter.mapToSql(medication));
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  FeedBackCompanion toCompanion(bool nullToAbsent) {
    return FeedBackCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      clinicDoctorId: clinicDoctorId == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicDoctorId),
      doctorId: doctorId == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorId),
      patientVisitIid: patientVisitIid == null && nullToAbsent
          ? const Value.absent()
          : Value(patientVisitIid),
      option:
          option == null && nullToAbsent ? const Value.absent() : Value(option),
      question: question == null && nullToAbsent
          ? const Value.absent()
          : Value(question),
      medication: medication == null && nullToAbsent
          ? const Value.absent()
          : Value(medication),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FeedBackData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FeedBackData(
      id: serializer.fromJson<int>(json['id']),
      clinicDoctorId: serializer.fromJson<int>(json['clinicDoctorId']),
      doctorId: serializer.fromJson<int>(json['doctorId']),
      patientVisitIid: serializer.fromJson<int>(json['patientVisitIid']),
      option: serializer.fromJson<String>(json['option']),
      question: serializer.fromJson<String>(json['question']),
      medication: serializer.fromJson<Medicationgenerated>(json['medication']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clinicDoctorId': serializer.toJson<int>(clinicDoctorId),
      'doctorId': serializer.toJson<int>(doctorId),
      'patientVisitIid': serializer.toJson<int>(patientVisitIid),
      'option': serializer.toJson<String>(option),
      'question': serializer.toJson<String>(question),
      'medication': serializer.toJson<Medicationgenerated>(medication),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FeedBackData copyWith(
          {int id,
          int clinicDoctorId,
          int doctorId,
          int patientVisitIid,
          String option,
          String question,
          Medicationgenerated medication,
          DateTime createdAt,
          DateTime updatedAt}) =>
      FeedBackData(
        id: id ?? this.id,
        clinicDoctorId: clinicDoctorId ?? this.clinicDoctorId,
        doctorId: doctorId ?? this.doctorId,
        patientVisitIid: patientVisitIid ?? this.patientVisitIid,
        option: option ?? this.option,
        question: question ?? this.question,
        medication: medication ?? this.medication,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('FeedBackData(')
          ..write('id: $id, ')
          ..write('clinicDoctorId: $clinicDoctorId, ')
          ..write('doctorId: $doctorId, ')
          ..write('patientVisitIid: $patientVisitIid, ')
          ..write('option: $option, ')
          ..write('question: $question, ')
          ..write('medication: $medication, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          clinicDoctorId.hashCode,
          $mrjc(
              doctorId.hashCode,
              $mrjc(
                  patientVisitIid.hashCode,
                  $mrjc(
                      option.hashCode,
                      $mrjc(
                          question.hashCode,
                          $mrjc(
                              medication.hashCode,
                              $mrjc(createdAt.hashCode,
                                  updatedAt.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FeedBackData &&
          other.id == this.id &&
          other.clinicDoctorId == this.clinicDoctorId &&
          other.doctorId == this.doctorId &&
          other.patientVisitIid == this.patientVisitIid &&
          other.option == this.option &&
          other.question == this.question &&
          other.medication == this.medication &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FeedBackCompanion extends UpdateCompanion<FeedBackData> {
  final Value<int> id;
  final Value<int> clinicDoctorId;
  final Value<int> doctorId;
  final Value<int> patientVisitIid;
  final Value<String> option;
  final Value<String> question;
  final Value<Medicationgenerated> medication;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const FeedBackCompanion({
    this.id = const Value.absent(),
    this.clinicDoctorId = const Value.absent(),
    this.doctorId = const Value.absent(),
    this.patientVisitIid = const Value.absent(),
    this.option = const Value.absent(),
    this.question = const Value.absent(),
    this.medication = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FeedBackCompanion.insert({
    this.id = const Value.absent(),
    @required int clinicDoctorId,
    @required int doctorId,
    @required int patientVisitIid,
    @required String option,
    @required String question,
    this.medication = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : clinicDoctorId = Value(clinicDoctorId),
        doctorId = Value(doctorId),
        patientVisitIid = Value(patientVisitIid),
        option = Value(option),
        question = Value(question);
  static Insertable<FeedBackData> custom({
    Expression<int> id,
    Expression<int> clinicDoctorId,
    Expression<int> doctorId,
    Expression<int> patientVisitIid,
    Expression<String> option,
    Expression<String> question,
    Expression<String> medication,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clinicDoctorId != null) 'clinic_doctor_id': clinicDoctorId,
      if (doctorId != null) 'doctor_id': doctorId,
      if (patientVisitIid != null) 'patient_visit_iid': patientVisitIid,
      if (option != null) 'option': option,
      if (question != null) 'question': question,
      if (medication != null) 'medication': medication,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FeedBackCompanion copyWith(
      {Value<int> id,
      Value<int> clinicDoctorId,
      Value<int> doctorId,
      Value<int> patientVisitIid,
      Value<String> option,
      Value<String> question,
      Value<Medicationgenerated> medication,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return FeedBackCompanion(
      id: id ?? this.id,
      clinicDoctorId: clinicDoctorId ?? this.clinicDoctorId,
      doctorId: doctorId ?? this.doctorId,
      patientVisitIid: patientVisitIid ?? this.patientVisitIid,
      option: option ?? this.option,
      question: question ?? this.question,
      medication: medication ?? this.medication,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clinicDoctorId.present) {
      map['clinic_doctor_id'] = Variable<int>(clinicDoctorId.value);
    }
    if (doctorId.present) {
      map['doctor_id'] = Variable<int>(doctorId.value);
    }
    if (patientVisitIid.present) {
      map['patient_visit_iid'] = Variable<int>(patientVisitIid.value);
    }
    if (option.present) {
      map['option'] = Variable<String>(option.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (medication.present) {
      final converter = $FeedBackTable.$converter0;
      map['medication'] =
          Variable<String>(converter.mapToSql(medication.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedBackCompanion(')
          ..write('id: $id, ')
          ..write('clinicDoctorId: $clinicDoctorId, ')
          ..write('doctorId: $doctorId, ')
          ..write('patientVisitIid: $patientVisitIid, ')
          ..write('option: $option, ')
          ..write('question: $question, ')
          ..write('medication: $medication, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FeedBackTable extends FeedBack
    with TableInfo<$FeedBackTable, FeedBackData> {
  final GeneratedDatabase _db;
  final String _alias;
  $FeedBackTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _clinicDoctorIdMeta =
      const VerificationMeta('clinicDoctorId');
  GeneratedIntColumn _clinicDoctorId;
  @override
  GeneratedIntColumn get clinicDoctorId =>
      _clinicDoctorId ??= _constructClinicDoctorId();
  GeneratedIntColumn _constructClinicDoctorId() {
    return GeneratedIntColumn(
      'clinic_doctor_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _doctorIdMeta = const VerificationMeta('doctorId');
  GeneratedIntColumn _doctorId;
  @override
  GeneratedIntColumn get doctorId => _doctorId ??= _constructDoctorId();
  GeneratedIntColumn _constructDoctorId() {
    return GeneratedIntColumn(
      'doctor_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _patientVisitIidMeta =
      const VerificationMeta('patientVisitIid');
  GeneratedIntColumn _patientVisitIid;
  @override
  GeneratedIntColumn get patientVisitIid =>
      _patientVisitIid ??= _constructPatientVisitIid();
  GeneratedIntColumn _constructPatientVisitIid() {
    return GeneratedIntColumn(
      'patient_visit_iid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _optionMeta = const VerificationMeta('option');
  GeneratedTextColumn _option;
  @override
  GeneratedTextColumn get option => _option ??= _constructOption();
  GeneratedTextColumn _constructOption() {
    return GeneratedTextColumn(
      'option',
      $tableName,
      false,
    );
  }

  final VerificationMeta _questionMeta = const VerificationMeta('question');
  GeneratedTextColumn _question;
  @override
  GeneratedTextColumn get question => _question ??= _constructQuestion();
  GeneratedTextColumn _constructQuestion() {
    return GeneratedTextColumn(
      'question',
      $tableName,
      false,
    );
  }

  final VerificationMeta _medicationMeta = const VerificationMeta('medication');
  GeneratedTextColumn _medication;
  @override
  GeneratedTextColumn get medication => _medication ??= _constructMedication();
  GeneratedTextColumn _constructMedication() {
    return GeneratedTextColumn(
      'medication',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        clinicDoctorId,
        doctorId,
        patientVisitIid,
        option,
        question,
        medication,
        createdAt,
        updatedAt
      ];
  @override
  $FeedBackTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'feed_back';
  @override
  final String actualTableName = 'feed_back';
  @override
  VerificationContext validateIntegrity(Insertable<FeedBackData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('clinic_doctor_id')) {
      context.handle(
          _clinicDoctorIdMeta,
          clinicDoctorId.isAcceptableOrUnknown(
              data['clinic_doctor_id'], _clinicDoctorIdMeta));
    } else if (isInserting) {
      context.missing(_clinicDoctorIdMeta);
    }
    if (data.containsKey('doctor_id')) {
      context.handle(_doctorIdMeta,
          doctorId.isAcceptableOrUnknown(data['doctor_id'], _doctorIdMeta));
    } else if (isInserting) {
      context.missing(_doctorIdMeta);
    }
    if (data.containsKey('patient_visit_iid')) {
      context.handle(
          _patientVisitIidMeta,
          patientVisitIid.isAcceptableOrUnknown(
              data['patient_visit_iid'], _patientVisitIidMeta));
    } else if (isInserting) {
      context.missing(_patientVisitIidMeta);
    }
    if (data.containsKey('option')) {
      context.handle(_optionMeta,
          option.isAcceptableOrUnknown(data['option'], _optionMeta));
    } else if (isInserting) {
      context.missing(_optionMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question'], _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    context.handle(_medicationMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedBackData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FeedBackData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FeedBackTable createAlias(String alias) {
    return $FeedBackTable(_db, alias);
  }

  static TypeConverter<Medicationgenerated, String> $converter0 =
      const MedicationConverter();
}

abstract class _$FeedBackDB extends GeneratedDatabase {
  _$FeedBackDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FeedBackTable _feedBack;
  $FeedBackTable get feedBack => _feedBack ??= $FeedBackTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [feedBack];
}
