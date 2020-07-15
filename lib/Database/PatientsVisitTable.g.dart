// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PatientsVisitTable.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PatientsVisitData extends DataClass
    implements Insertable<PatientsVisitData> {
  final int id;
  final int mobileNo;
  final int age;
  final String patientName;
  final int temperature;
  final int pulse;
  final int weight;
  final int patientId;
  final int clinicDoctorId;
  final BriefHistorygenerated briefHistory;
  final VisitReasongenerated visitReason;
  final Examinationgenerated examination;
  final Dignosisgenerated diagnosis;
  final Medicationgenerated medication;
  final String allergies;
  final String lifestyle;
  final bool isOnline;
  PatientsVisitData(
      {@required this.id,
      @required this.mobileNo,
      this.age,
      @required this.patientName,
      @required this.temperature,
      @required this.pulse,
      this.weight,
      @required this.patientId,
      this.clinicDoctorId,
      this.briefHistory,
      this.visitReason,
      this.examination,
      this.diagnosis,
      this.medication,
      @required this.allergies,
      @required this.lifestyle,
      @required this.isOnline});
  factory PatientsVisitData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return PatientsVisitData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      mobileNo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}mobile_no']),
      age: intType.mapFromDatabaseResponse(data['${effectivePrefix}age']),
      patientName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}patient_name']),
      temperature: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}temperature']),
      pulse: intType.mapFromDatabaseResponse(data['${effectivePrefix}pulse']),
      weight: intType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      patientId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}patient_id']),
      clinicDoctorId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}clinic_doctor_id']),
      briefHistory: $PatientsVisitTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}brief_history'])),
      visitReason: $PatientsVisitTable.$converter1.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visit_reason'])),
      examination: $PatientsVisitTable.$converter2.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}examination'])),
      diagnosis: $PatientsVisitTable.$converter3.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}diagnosis'])),
      medication: $PatientsVisitTable.$converter4.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}medication'])),
      allergies: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}allergies']),
      lifestyle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}lifestyle']),
      isOnline:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_online']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || mobileNo != null) {
      map['mobile_no'] = Variable<int>(mobileNo);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || patientName != null) {
      map['patient_name'] = Variable<String>(patientName);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<int>(temperature);
    }
    if (!nullToAbsent || pulse != null) {
      map['pulse'] = Variable<int>(pulse);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int>(weight);
    }
    if (!nullToAbsent || patientId != null) {
      map['patient_id'] = Variable<int>(patientId);
    }
    if (!nullToAbsent || clinicDoctorId != null) {
      map['clinic_doctor_id'] = Variable<int>(clinicDoctorId);
    }
    if (!nullToAbsent || briefHistory != null) {
      final converter = $PatientsVisitTable.$converter0;
      map['brief_history'] = Variable<String>(converter.mapToSql(briefHistory));
    }
    if (!nullToAbsent || visitReason != null) {
      final converter = $PatientsVisitTable.$converter1;
      map['visit_reason'] = Variable<String>(converter.mapToSql(visitReason));
    }
    if (!nullToAbsent || examination != null) {
      final converter = $PatientsVisitTable.$converter2;
      map['examination'] = Variable<String>(converter.mapToSql(examination));
    }
    if (!nullToAbsent || diagnosis != null) {
      final converter = $PatientsVisitTable.$converter3;
      map['diagnosis'] = Variable<String>(converter.mapToSql(diagnosis));
    }
    if (!nullToAbsent || medication != null) {
      final converter = $PatientsVisitTable.$converter4;
      map['medication'] = Variable<String>(converter.mapToSql(medication));
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = Variable<String>(allergies);
    }
    if (!nullToAbsent || lifestyle != null) {
      map['lifestyle'] = Variable<String>(lifestyle);
    }
    if (!nullToAbsent || isOnline != null) {
      map['is_online'] = Variable<bool>(isOnline);
    }
    return map;
  }

  PatientsVisitCompanion toCompanion(bool nullToAbsent) {
    return PatientsVisitCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      mobileNo: mobileNo == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileNo),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      patientName: patientName == null && nullToAbsent
          ? const Value.absent()
          : Value(patientName),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      pulse:
          pulse == null && nullToAbsent ? const Value.absent() : Value(pulse),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      patientId: patientId == null && nullToAbsent
          ? const Value.absent()
          : Value(patientId),
      clinicDoctorId: clinicDoctorId == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicDoctorId),
      briefHistory: briefHistory == null && nullToAbsent
          ? const Value.absent()
          : Value(briefHistory),
      visitReason: visitReason == null && nullToAbsent
          ? const Value.absent()
          : Value(visitReason),
      examination: examination == null && nullToAbsent
          ? const Value.absent()
          : Value(examination),
      diagnosis: diagnosis == null && nullToAbsent
          ? const Value.absent()
          : Value(diagnosis),
      medication: medication == null && nullToAbsent
          ? const Value.absent()
          : Value(medication),
      allergies: allergies == null && nullToAbsent
          ? const Value.absent()
          : Value(allergies),
      lifestyle: lifestyle == null && nullToAbsent
          ? const Value.absent()
          : Value(lifestyle),
      isOnline: isOnline == null && nullToAbsent
          ? const Value.absent()
          : Value(isOnline),
    );
  }

  factory PatientsVisitData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PatientsVisitData(
      id: serializer.fromJson<int>(json['id']),
      mobileNo: serializer.fromJson<int>(json['mobileNo']),
      age: serializer.fromJson<int>(json['age']),
      patientName: serializer.fromJson<String>(json['patientName']),
      temperature: serializer.fromJson<int>(json['temperature']),
      pulse: serializer.fromJson<int>(json['pulse']),
      weight: serializer.fromJson<int>(json['weight']),
      patientId: serializer.fromJson<int>(json['patientId']),
      clinicDoctorId: serializer.fromJson<int>(json['clinicDoctorId']),
      briefHistory:
          serializer.fromJson<BriefHistorygenerated>(json['briefHistory']),
      visitReason:
          serializer.fromJson<VisitReasongenerated>(json['visitReason']),
      examination:
          serializer.fromJson<Examinationgenerated>(json['examination']),
      diagnosis: serializer.fromJson<Dignosisgenerated>(json['diagnosis']),
      medication: serializer.fromJson<Medicationgenerated>(json['medication']),
      allergies: serializer.fromJson<String>(json['allergies']),
      lifestyle: serializer.fromJson<String>(json['lifestyle']),
      isOnline: serializer.fromJson<bool>(json['isOnline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mobileNo': serializer.toJson<int>(mobileNo),
      'age': serializer.toJson<int>(age),
      'patientName': serializer.toJson<String>(patientName),
      'temperature': serializer.toJson<int>(temperature),
      'pulse': serializer.toJson<int>(pulse),
      'weight': serializer.toJson<int>(weight),
      'patientId': serializer.toJson<int>(patientId),
      'clinicDoctorId': serializer.toJson<int>(clinicDoctorId),
      'briefHistory': serializer.toJson<BriefHistorygenerated>(briefHistory),
      'visitReason': serializer.toJson<VisitReasongenerated>(visitReason),
      'examination': serializer.toJson<Examinationgenerated>(examination),
      'diagnosis': serializer.toJson<Dignosisgenerated>(diagnosis),
      'medication': serializer.toJson<Medicationgenerated>(medication),
      'allergies': serializer.toJson<String>(allergies),
      'lifestyle': serializer.toJson<String>(lifestyle),
      'isOnline': serializer.toJson<bool>(isOnline),
    };
  }

  PatientsVisitData copyWith(
          {int id,
          int mobileNo,
          int age,
          String patientName,
          int temperature,
          int pulse,
          int weight,
          int patientId,
          int clinicDoctorId,
          BriefHistorygenerated briefHistory,
          VisitReasongenerated visitReason,
          Examinationgenerated examination,
          Dignosisgenerated diagnosis,
          Medicationgenerated medication,
          String allergies,
          String lifestyle,
          bool isOnline}) =>
      PatientsVisitData(
        id: id ?? this.id,
        mobileNo: mobileNo ?? this.mobileNo,
        age: age ?? this.age,
        patientName: patientName ?? this.patientName,
        temperature: temperature ?? this.temperature,
        pulse: pulse ?? this.pulse,
        weight: weight ?? this.weight,
        patientId: patientId ?? this.patientId,
        clinicDoctorId: clinicDoctorId ?? this.clinicDoctorId,
        briefHistory: briefHistory ?? this.briefHistory,
        visitReason: visitReason ?? this.visitReason,
        examination: examination ?? this.examination,
        diagnosis: diagnosis ?? this.diagnosis,
        medication: medication ?? this.medication,
        allergies: allergies ?? this.allergies,
        lifestyle: lifestyle ?? this.lifestyle,
        isOnline: isOnline ?? this.isOnline,
      );
  @override
  String toString() {
    return (StringBuffer('PatientsVisitData(')
          ..write('id: $id, ')
          ..write('mobileNo: $mobileNo, ')
          ..write('age: $age, ')
          ..write('patientName: $patientName, ')
          ..write('temperature: $temperature, ')
          ..write('pulse: $pulse, ')
          ..write('weight: $weight, ')
          ..write('patientId: $patientId, ')
          ..write('clinicDoctorId: $clinicDoctorId, ')
          ..write('briefHistory: $briefHistory, ')
          ..write('visitReason: $visitReason, ')
          ..write('examination: $examination, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('medication: $medication, ')
          ..write('allergies: $allergies, ')
          ..write('lifestyle: $lifestyle, ')
          ..write('isOnline: $isOnline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          mobileNo.hashCode,
          $mrjc(
              age.hashCode,
              $mrjc(
                  patientName.hashCode,
                  $mrjc(
                      temperature.hashCode,
                      $mrjc(
                          pulse.hashCode,
                          $mrjc(
                              weight.hashCode,
                              $mrjc(
                                  patientId.hashCode,
                                  $mrjc(
                                      clinicDoctorId.hashCode,
                                      $mrjc(
                                          briefHistory.hashCode,
                                          $mrjc(
                                              visitReason.hashCode,
                                              $mrjc(
                                                  examination.hashCode,
                                                  $mrjc(
                                                      diagnosis.hashCode,
                                                      $mrjc(
                                                          medication.hashCode,
                                                          $mrjc(
                                                              allergies
                                                                  .hashCode,
                                                              $mrjc(
                                                                  lifestyle
                                                                      .hashCode,
                                                                  isOnline
                                                                      .hashCode)))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PatientsVisitData &&
          other.id == this.id &&
          other.mobileNo == this.mobileNo &&
          other.age == this.age &&
          other.patientName == this.patientName &&
          other.temperature == this.temperature &&
          other.pulse == this.pulse &&
          other.weight == this.weight &&
          other.patientId == this.patientId &&
          other.clinicDoctorId == this.clinicDoctorId &&
          other.briefHistory == this.briefHistory &&
          other.visitReason == this.visitReason &&
          other.examination == this.examination &&
          other.diagnosis == this.diagnosis &&
          other.medication == this.medication &&
          other.allergies == this.allergies &&
          other.lifestyle == this.lifestyle &&
          other.isOnline == this.isOnline);
}

class PatientsVisitCompanion extends UpdateCompanion<PatientsVisitData> {
  final Value<int> id;
  final Value<int> mobileNo;
  final Value<int> age;
  final Value<String> patientName;
  final Value<int> temperature;
  final Value<int> pulse;
  final Value<int> weight;
  final Value<int> patientId;
  final Value<int> clinicDoctorId;
  final Value<BriefHistorygenerated> briefHistory;
  final Value<VisitReasongenerated> visitReason;
  final Value<Examinationgenerated> examination;
  final Value<Dignosisgenerated> diagnosis;
  final Value<Medicationgenerated> medication;
  final Value<String> allergies;
  final Value<String> lifestyle;
  final Value<bool> isOnline;
  const PatientsVisitCompanion({
    this.id = const Value.absent(),
    this.mobileNo = const Value.absent(),
    this.age = const Value.absent(),
    this.patientName = const Value.absent(),
    this.temperature = const Value.absent(),
    this.pulse = const Value.absent(),
    this.weight = const Value.absent(),
    this.patientId = const Value.absent(),
    this.clinicDoctorId = const Value.absent(),
    this.briefHistory = const Value.absent(),
    this.visitReason = const Value.absent(),
    this.examination = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.medication = const Value.absent(),
    this.allergies = const Value.absent(),
    this.lifestyle = const Value.absent(),
    this.isOnline = const Value.absent(),
  });
  PatientsVisitCompanion.insert({
    this.id = const Value.absent(),
    @required int mobileNo,
    this.age = const Value.absent(),
    @required String patientName,
    this.temperature = const Value.absent(),
    this.pulse = const Value.absent(),
    this.weight = const Value.absent(),
    @required int patientId,
    this.clinicDoctorId = const Value.absent(),
    this.briefHistory = const Value.absent(),
    this.visitReason = const Value.absent(),
    this.examination = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.medication = const Value.absent(),
    @required String allergies,
    @required String lifestyle,
    this.isOnline = const Value.absent(),
  })  : mobileNo = Value(mobileNo),
        patientName = Value(patientName),
        patientId = Value(patientId),
        allergies = Value(allergies),
        lifestyle = Value(lifestyle);
  static Insertable<PatientsVisitData> custom({
    Expression<int> id,
    Expression<int> mobileNo,
    Expression<int> age,
    Expression<String> patientName,
    Expression<int> temperature,
    Expression<int> pulse,
    Expression<int> weight,
    Expression<int> patientId,
    Expression<int> clinicDoctorId,
    Expression<String> briefHistory,
    Expression<String> visitReason,
    Expression<String> examination,
    Expression<String> diagnosis,
    Expression<String> medication,
    Expression<String> allergies,
    Expression<String> lifestyle,
    Expression<bool> isOnline,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mobileNo != null) 'mobile_no': mobileNo,
      if (age != null) 'age': age,
      if (patientName != null) 'patient_name': patientName,
      if (temperature != null) 'temperature': temperature,
      if (pulse != null) 'pulse': pulse,
      if (weight != null) 'weight': weight,
      if (patientId != null) 'patient_id': patientId,
      if (clinicDoctorId != null) 'clinic_doctor_id': clinicDoctorId,
      if (briefHistory != null) 'brief_history': briefHistory,
      if (visitReason != null) 'visit_reason': visitReason,
      if (examination != null) 'examination': examination,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (medication != null) 'medication': medication,
      if (allergies != null) 'allergies': allergies,
      if (lifestyle != null) 'lifestyle': lifestyle,
      if (isOnline != null) 'is_online': isOnline,
    });
  }

  PatientsVisitCompanion copyWith(
      {Value<int> id,
      Value<int> mobileNo,
      Value<int> age,
      Value<String> patientName,
      Value<int> temperature,
      Value<int> pulse,
      Value<int> weight,
      Value<int> patientId,
      Value<int> clinicDoctorId,
      Value<BriefHistorygenerated> briefHistory,
      Value<VisitReasongenerated> visitReason,
      Value<Examinationgenerated> examination,
      Value<Dignosisgenerated> diagnosis,
      Value<Medicationgenerated> medication,
      Value<String> allergies,
      Value<String> lifestyle,
      Value<bool> isOnline}) {
    return PatientsVisitCompanion(
      id: id ?? this.id,
      mobileNo: mobileNo ?? this.mobileNo,
      age: age ?? this.age,
      patientName: patientName ?? this.patientName,
      temperature: temperature ?? this.temperature,
      pulse: pulse ?? this.pulse,
      weight: weight ?? this.weight,
      patientId: patientId ?? this.patientId,
      clinicDoctorId: clinicDoctorId ?? this.clinicDoctorId,
      briefHistory: briefHistory ?? this.briefHistory,
      visitReason: visitReason ?? this.visitReason,
      examination: examination ?? this.examination,
      diagnosis: diagnosis ?? this.diagnosis,
      medication: medication ?? this.medication,
      allergies: allergies ?? this.allergies,
      lifestyle: lifestyle ?? this.lifestyle,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mobileNo.present) {
      map['mobile_no'] = Variable<int>(mobileNo.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (patientName.present) {
      map['patient_name'] = Variable<String>(patientName.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<int>(temperature.value);
    }
    if (pulse.present) {
      map['pulse'] = Variable<int>(pulse.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (clinicDoctorId.present) {
      map['clinic_doctor_id'] = Variable<int>(clinicDoctorId.value);
    }
    if (briefHistory.present) {
      final converter = $PatientsVisitTable.$converter0;
      map['brief_history'] =
          Variable<String>(converter.mapToSql(briefHistory.value));
    }
    if (visitReason.present) {
      final converter = $PatientsVisitTable.$converter1;
      map['visit_reason'] =
          Variable<String>(converter.mapToSql(visitReason.value));
    }
    if (examination.present) {
      final converter = $PatientsVisitTable.$converter2;
      map['examination'] =
          Variable<String>(converter.mapToSql(examination.value));
    }
    if (diagnosis.present) {
      final converter = $PatientsVisitTable.$converter3;
      map['diagnosis'] = Variable<String>(converter.mapToSql(diagnosis.value));
    }
    if (medication.present) {
      final converter = $PatientsVisitTable.$converter4;
      map['medication'] =
          Variable<String>(converter.mapToSql(medication.value));
    }
    if (allergies.present) {
      map['allergies'] = Variable<String>(allergies.value);
    }
    if (lifestyle.present) {
      map['lifestyle'] = Variable<String>(lifestyle.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<bool>(isOnline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsVisitCompanion(')
          ..write('id: $id, ')
          ..write('mobileNo: $mobileNo, ')
          ..write('age: $age, ')
          ..write('patientName: $patientName, ')
          ..write('temperature: $temperature, ')
          ..write('pulse: $pulse, ')
          ..write('weight: $weight, ')
          ..write('patientId: $patientId, ')
          ..write('clinicDoctorId: $clinicDoctorId, ')
          ..write('briefHistory: $briefHistory, ')
          ..write('visitReason: $visitReason, ')
          ..write('examination: $examination, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('medication: $medication, ')
          ..write('allergies: $allergies, ')
          ..write('lifestyle: $lifestyle, ')
          ..write('isOnline: $isOnline')
          ..write(')'))
        .toString();
  }
}

class $PatientsVisitTable extends PatientsVisit
    with TableInfo<$PatientsVisitTable, PatientsVisitData> {
  final GeneratedDatabase _db;
  final String _alias;
  $PatientsVisitTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _mobileNoMeta = const VerificationMeta('mobileNo');
  GeneratedIntColumn _mobileNo;
  @override
  GeneratedIntColumn get mobileNo => _mobileNo ??= _constructMobileNo();
  GeneratedIntColumn _constructMobileNo() {
    return GeneratedIntColumn(
      'mobile_no',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ageMeta = const VerificationMeta('age');
  GeneratedIntColumn _age;
  @override
  GeneratedIntColumn get age => _age ??= _constructAge();
  GeneratedIntColumn _constructAge() {
    return GeneratedIntColumn(
      'age',
      $tableName,
      true,
    );
  }

  final VerificationMeta _patientNameMeta =
      const VerificationMeta('patientName');
  GeneratedTextColumn _patientName;
  @override
  GeneratedTextColumn get patientName =>
      _patientName ??= _constructPatientName();
  GeneratedTextColumn _constructPatientName() {
    return GeneratedTextColumn(
      'patient_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  GeneratedIntColumn _temperature;
  @override
  GeneratedIntColumn get temperature =>
      _temperature ??= _constructTemperature();
  GeneratedIntColumn _constructTemperature() {
    return GeneratedIntColumn('temperature', $tableName, false,
        defaultValue: Constant(98));
  }

  final VerificationMeta _pulseMeta = const VerificationMeta('pulse');
  GeneratedIntColumn _pulse;
  @override
  GeneratedIntColumn get pulse => _pulse ??= _constructPulse();
  GeneratedIntColumn _constructPulse() {
    return GeneratedIntColumn('pulse', $tableName, false,
        defaultValue: Constant(60));
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedIntColumn _weight;
  @override
  GeneratedIntColumn get weight => _weight ??= _constructWeight();
  GeneratedIntColumn _constructWeight() {
    return GeneratedIntColumn(
      'weight',
      $tableName,
      true,
    );
  }

  final VerificationMeta _patientIdMeta = const VerificationMeta('patientId');
  GeneratedIntColumn _patientId;
  @override
  GeneratedIntColumn get patientId => _patientId ??= _constructPatientId();
  GeneratedIntColumn _constructPatientId() {
    return GeneratedIntColumn(
      'patient_id',
      $tableName,
      false,
    );
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
      true,
    );
  }

  final VerificationMeta _briefHistoryMeta =
      const VerificationMeta('briefHistory');
  GeneratedTextColumn _briefHistory;
  @override
  GeneratedTextColumn get briefHistory =>
      _briefHistory ??= _constructBriefHistory();
  GeneratedTextColumn _constructBriefHistory() {
    return GeneratedTextColumn(
      'brief_history',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitReasonMeta =
      const VerificationMeta('visitReason');
  GeneratedTextColumn _visitReason;
  @override
  GeneratedTextColumn get visitReason =>
      _visitReason ??= _constructVisitReason();
  GeneratedTextColumn _constructVisitReason() {
    return GeneratedTextColumn(
      'visit_reason',
      $tableName,
      true,
    );
  }

  final VerificationMeta _examinationMeta =
      const VerificationMeta('examination');
  GeneratedTextColumn _examination;
  @override
  GeneratedTextColumn get examination =>
      _examination ??= _constructExamination();
  GeneratedTextColumn _constructExamination() {
    return GeneratedTextColumn(
      'examination',
      $tableName,
      true,
    );
  }

  final VerificationMeta _diagnosisMeta = const VerificationMeta('diagnosis');
  GeneratedTextColumn _diagnosis;
  @override
  GeneratedTextColumn get diagnosis => _diagnosis ??= _constructDiagnosis();
  GeneratedTextColumn _constructDiagnosis() {
    return GeneratedTextColumn(
      'diagnosis',
      $tableName,
      true,
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

  final VerificationMeta _allergiesMeta = const VerificationMeta('allergies');
  GeneratedTextColumn _allergies;
  @override
  GeneratedTextColumn get allergies => _allergies ??= _constructAllergies();
  GeneratedTextColumn _constructAllergies() {
    return GeneratedTextColumn(
      'allergies',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lifestyleMeta = const VerificationMeta('lifestyle');
  GeneratedTextColumn _lifestyle;
  @override
  GeneratedTextColumn get lifestyle => _lifestyle ??= _constructLifestyle();
  GeneratedTextColumn _constructLifestyle() {
    return GeneratedTextColumn(
      'lifestyle',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isOnlineMeta = const VerificationMeta('isOnline');
  GeneratedBoolColumn _isOnline;
  @override
  GeneratedBoolColumn get isOnline => _isOnline ??= _constructIsOnline();
  GeneratedBoolColumn _constructIsOnline() {
    return GeneratedBoolColumn('is_online', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        mobileNo,
        age,
        patientName,
        temperature,
        pulse,
        weight,
        patientId,
        clinicDoctorId,
        briefHistory,
        visitReason,
        examination,
        diagnosis,
        medication,
        allergies,
        lifestyle,
        isOnline
      ];
  @override
  $PatientsVisitTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'patients_visit';
  @override
  final String actualTableName = 'patients_visit';
  @override
  VerificationContext validateIntegrity(Insertable<PatientsVisitData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('mobile_no')) {
      context.handle(_mobileNoMeta,
          mobileNo.isAcceptableOrUnknown(data['mobile_no'], _mobileNoMeta));
    } else if (isInserting) {
      context.missing(_mobileNoMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age'], _ageMeta));
    }
    if (data.containsKey('patient_name')) {
      context.handle(
          _patientNameMeta,
          patientName.isAcceptableOrUnknown(
              data['patient_name'], _patientNameMeta));
    } else if (isInserting) {
      context.missing(_patientNameMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature'], _temperatureMeta));
    }
    if (data.containsKey('pulse')) {
      context.handle(
          _pulseMeta, pulse.isAcceptableOrUnknown(data['pulse'], _pulseMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id'], _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('clinic_doctor_id')) {
      context.handle(
          _clinicDoctorIdMeta,
          clinicDoctorId.isAcceptableOrUnknown(
              data['clinic_doctor_id'], _clinicDoctorIdMeta));
    }
    context.handle(_briefHistoryMeta, const VerificationResult.success());
    context.handle(_visitReasonMeta, const VerificationResult.success());
    context.handle(_examinationMeta, const VerificationResult.success());
    context.handle(_diagnosisMeta, const VerificationResult.success());
    context.handle(_medicationMeta, const VerificationResult.success());
    if (data.containsKey('allergies')) {
      context.handle(_allergiesMeta,
          allergies.isAcceptableOrUnknown(data['allergies'], _allergiesMeta));
    } else if (isInserting) {
      context.missing(_allergiesMeta);
    }
    if (data.containsKey('lifestyle')) {
      context.handle(_lifestyleMeta,
          lifestyle.isAcceptableOrUnknown(data['lifestyle'], _lifestyleMeta));
    } else if (isInserting) {
      context.missing(_lifestyleMeta);
    }
    if (data.containsKey('is_online')) {
      context.handle(_isOnlineMeta,
          isOnline.isAcceptableOrUnknown(data['is_online'], _isOnlineMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientsVisitData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PatientsVisitData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PatientsVisitTable createAlias(String alias) {
    return $PatientsVisitTable(_db, alias);
  }

  static TypeConverter<BriefHistorygenerated, String> $converter0 =
      const BriefHistoryConverter();
  static TypeConverter<VisitReasongenerated, String> $converter1 =
      const VisitReasonConverter();
  static TypeConverter<Examinationgenerated, String> $converter2 =
      const ExaminationConverter();
  static TypeConverter<Dignosisgenerated, String> $converter3 =
      const DignosisConverter();
  static TypeConverter<Medicationgenerated, String> $converter4 =
      const MedicationConverter();
}

abstract class _$PatientsVisitDB extends GeneratedDatabase {
  _$PatientsVisitDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PatientsVisitTable _patientsVisit;
  $PatientsVisitTable get patientsVisit =>
      _patientsVisit ??= $PatientsVisitTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [patientsVisit];
}
