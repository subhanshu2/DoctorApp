// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenTable.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Token extends DataClass implements Insertable<Token> {
  final int id;
  final int tokenno;
  final int doctorid;
  final DateTime tokentime;
  final String name;
  final int age;
  final String address;
  final int mobileno;
  final String appointmenttype;
  final String visittype;
  final String bookedtype;
  final int fees;
  final bool cancelled;
  final bool booked;
  final DateTime updatedAt;
  final bool isOnline;
  final String guid;
  final String gender;
  final bool shift;
  Token(
      {@required this.id,
      @required this.tokenno,
      @required this.doctorid,
      @required this.tokentime,
      this.name,
      this.age,
      this.address,
      this.mobileno,
      this.appointmenttype,
      this.visittype,
      this.bookedtype,
      @required this.fees,
      @required this.cancelled,
      @required this.booked,
      this.updatedAt,
      @required this.isOnline,
      this.guid,
      this.gender,
      @required this.shift});
  factory Token.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Token(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      tokenno:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tokenno']),
      doctorid:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}doctorid']),
      tokentime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}tokentime']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      age: intType.mapFromDatabaseResponse(data['${effectivePrefix}age']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      mobileno:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}mobileno']),
      appointmenttype: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}appointmenttype']),
      visittype: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visittype']),
      bookedtype: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}bookedtype']),
      fees: intType.mapFromDatabaseResponse(data['${effectivePrefix}fees']),
      cancelled:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}cancelled']),
      booked:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}booked']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      isOnline:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_online']),
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      gender:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      shift: boolType.mapFromDatabaseResponse(data['${effectivePrefix}shift']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || tokenno != null) {
      map['tokenno'] = Variable<int>(tokenno);
    }
    if (!nullToAbsent || doctorid != null) {
      map['doctorid'] = Variable<int>(doctorid);
    }
    if (!nullToAbsent || tokentime != null) {
      map['tokentime'] = Variable<DateTime>(tokentime);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || mobileno != null) {
      map['mobileno'] = Variable<int>(mobileno);
    }
    if (!nullToAbsent || appointmenttype != null) {
      map['appointmenttype'] = Variable<String>(appointmenttype);
    }
    if (!nullToAbsent || visittype != null) {
      map['visittype'] = Variable<String>(visittype);
    }
    if (!nullToAbsent || bookedtype != null) {
      map['bookedtype'] = Variable<String>(bookedtype);
    }
    if (!nullToAbsent || fees != null) {
      map['fees'] = Variable<int>(fees);
    }
    if (!nullToAbsent || cancelled != null) {
      map['cancelled'] = Variable<bool>(cancelled);
    }
    if (!nullToAbsent || booked != null) {
      map['booked'] = Variable<bool>(booked);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || isOnline != null) {
      map['is_online'] = Variable<bool>(isOnline);
    }
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || shift != null) {
      map['shift'] = Variable<bool>(shift);
    }
    return map;
  }

  TokensCompanion toCompanion(bool nullToAbsent) {
    return TokensCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      tokenno: tokenno == null && nullToAbsent
          ? const Value.absent()
          : Value(tokenno),
      doctorid: doctorid == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorid),
      tokentime: tokentime == null && nullToAbsent
          ? const Value.absent()
          : Value(tokentime),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      mobileno: mobileno == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileno),
      appointmenttype: appointmenttype == null && nullToAbsent
          ? const Value.absent()
          : Value(appointmenttype),
      visittype: visittype == null && nullToAbsent
          ? const Value.absent()
          : Value(visittype),
      bookedtype: bookedtype == null && nullToAbsent
          ? const Value.absent()
          : Value(bookedtype),
      fees: fees == null && nullToAbsent ? const Value.absent() : Value(fees),
      cancelled: cancelled == null && nullToAbsent
          ? const Value.absent()
          : Value(cancelled),
      booked:
          booked == null && nullToAbsent ? const Value.absent() : Value(booked),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isOnline: isOnline == null && nullToAbsent
          ? const Value.absent()
          : Value(isOnline),
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      shift:
          shift == null && nullToAbsent ? const Value.absent() : Value(shift),
    );
  }

  factory Token.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Token(
      id: serializer.fromJson<int>(json['id']),
      tokenno: serializer.fromJson<int>(json['tokenno']),
      doctorid: serializer.fromJson<int>(json['doctorid']),
      tokentime: serializer.fromJson<DateTime>(json['tokentime']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      address: serializer.fromJson<String>(json['address']),
      mobileno: serializer.fromJson<int>(json['mobileno']),
      appointmenttype: serializer.fromJson<String>(json['appointmenttype']),
      visittype: serializer.fromJson<String>(json['visittype']),
      bookedtype: serializer.fromJson<String>(json['bookedtype']),
      fees: serializer.fromJson<int>(json['fees']),
      cancelled: serializer.fromJson<bool>(json['cancelled']),
      booked: serializer.fromJson<bool>(json['booked']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isOnline: serializer.fromJson<bool>(json['isOnline']),
      guid: serializer.fromJson<String>(json['guid']),
      gender: serializer.fromJson<String>(json['gender']),
      shift: serializer.fromJson<bool>(json['shift']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tokenno': serializer.toJson<int>(tokenno),
      'doctorid': serializer.toJson<int>(doctorid),
      'tokentime': serializer.toJson<DateTime>(tokentime),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'address': serializer.toJson<String>(address),
      'mobileno': serializer.toJson<int>(mobileno),
      'appointmenttype': serializer.toJson<String>(appointmenttype),
      'visittype': serializer.toJson<String>(visittype),
      'bookedtype': serializer.toJson<String>(bookedtype),
      'fees': serializer.toJson<int>(fees),
      'cancelled': serializer.toJson<bool>(cancelled),
      'booked': serializer.toJson<bool>(booked),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isOnline': serializer.toJson<bool>(isOnline),
      'guid': serializer.toJson<String>(guid),
      'gender': serializer.toJson<String>(gender),
      'shift': serializer.toJson<bool>(shift),
    };
  }

  Token copyWith(
          {int id,
          int tokenno,
          int doctorid,
          DateTime tokentime,
          String name,
          int age,
          String address,
          int mobileno,
          String appointmenttype,
          String visittype,
          String bookedtype,
          int fees,
          bool cancelled,
          bool booked,
          DateTime updatedAt,
          bool isOnline,
          String guid,
          String gender,
          bool shift}) =>
      Token(
        id: id ?? this.id,
        tokenno: tokenno ?? this.tokenno,
        doctorid: doctorid ?? this.doctorid,
        tokentime: tokentime ?? this.tokentime,
        name: name ?? this.name,
        age: age ?? this.age,
        address: address ?? this.address,
        mobileno: mobileno ?? this.mobileno,
        appointmenttype: appointmenttype ?? this.appointmenttype,
        visittype: visittype ?? this.visittype,
        bookedtype: bookedtype ?? this.bookedtype,
        fees: fees ?? this.fees,
        cancelled: cancelled ?? this.cancelled,
        booked: booked ?? this.booked,
        updatedAt: updatedAt ?? this.updatedAt,
        isOnline: isOnline ?? this.isOnline,
        guid: guid ?? this.guid,
        gender: gender ?? this.gender,
        shift: shift ?? this.shift,
      );
  @override
  String toString() {
    return (StringBuffer('Token(')
          ..write('id: $id, ')
          ..write('tokenno: $tokenno, ')
          ..write('doctorid: $doctorid, ')
          ..write('tokentime: $tokentime, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('address: $address, ')
          ..write('mobileno: $mobileno, ')
          ..write('appointmenttype: $appointmenttype, ')
          ..write('visittype: $visittype, ')
          ..write('bookedtype: $bookedtype, ')
          ..write('fees: $fees, ')
          ..write('cancelled: $cancelled, ')
          ..write('booked: $booked, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isOnline: $isOnline, ')
          ..write('guid: $guid, ')
          ..write('gender: $gender, ')
          ..write('shift: $shift')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          tokenno.hashCode,
          $mrjc(
              doctorid.hashCode,
              $mrjc(
                  tokentime.hashCode,
                  $mrjc(
                      name.hashCode,
                      $mrjc(
                          age.hashCode,
                          $mrjc(
                              address.hashCode,
                              $mrjc(
                                  mobileno.hashCode,
                                  $mrjc(
                                      appointmenttype.hashCode,
                                      $mrjc(
                                          visittype.hashCode,
                                          $mrjc(
                                              bookedtype.hashCode,
                                              $mrjc(
                                                  fees.hashCode,
                                                  $mrjc(
                                                      cancelled.hashCode,
                                                      $mrjc(
                                                          booked.hashCode,
                                                          $mrjc(
                                                              updatedAt
                                                                  .hashCode,
                                                              $mrjc(
                                                                  isOnline
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      guid
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          gender
                                                                              .hashCode,
                                                                          shift
                                                                              .hashCode)))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Token &&
          other.id == this.id &&
          other.tokenno == this.tokenno &&
          other.doctorid == this.doctorid &&
          other.tokentime == this.tokentime &&
          other.name == this.name &&
          other.age == this.age &&
          other.address == this.address &&
          other.mobileno == this.mobileno &&
          other.appointmenttype == this.appointmenttype &&
          other.visittype == this.visittype &&
          other.bookedtype == this.bookedtype &&
          other.fees == this.fees &&
          other.cancelled == this.cancelled &&
          other.booked == this.booked &&
          other.updatedAt == this.updatedAt &&
          other.isOnline == this.isOnline &&
          other.guid == this.guid &&
          other.gender == this.gender &&
          other.shift == this.shift);
}

class TokensCompanion extends UpdateCompanion<Token> {
  final Value<int> id;
  final Value<int> tokenno;
  final Value<int> doctorid;
  final Value<DateTime> tokentime;
  final Value<String> name;
  final Value<int> age;
  final Value<String> address;
  final Value<int> mobileno;
  final Value<String> appointmenttype;
  final Value<String> visittype;
  final Value<String> bookedtype;
  final Value<int> fees;
  final Value<bool> cancelled;
  final Value<bool> booked;
  final Value<DateTime> updatedAt;
  final Value<bool> isOnline;
  final Value<String> guid;
  final Value<String> gender;
  final Value<bool> shift;
  const TokensCompanion({
    this.id = const Value.absent(),
    this.tokenno = const Value.absent(),
    this.doctorid = const Value.absent(),
    this.tokentime = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.address = const Value.absent(),
    this.mobileno = const Value.absent(),
    this.appointmenttype = const Value.absent(),
    this.visittype = const Value.absent(),
    this.bookedtype = const Value.absent(),
    this.fees = const Value.absent(),
    this.cancelled = const Value.absent(),
    this.booked = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.guid = const Value.absent(),
    this.gender = const Value.absent(),
    this.shift = const Value.absent(),
  });
  TokensCompanion.insert({
    this.id = const Value.absent(),
    @required int tokenno,
    @required int doctorid,
    @required DateTime tokentime,
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.address = const Value.absent(),
    this.mobileno = const Value.absent(),
    this.appointmenttype = const Value.absent(),
    this.visittype = const Value.absent(),
    this.bookedtype = const Value.absent(),
    @required int fees,
    this.cancelled = const Value.absent(),
    this.booked = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.guid = const Value.absent(),
    this.gender = const Value.absent(),
    this.shift = const Value.absent(),
  })  : tokenno = Value(tokenno),
        doctorid = Value(doctorid),
        tokentime = Value(tokentime),
        fees = Value(fees);
  static Insertable<Token> custom({
    Expression<int> id,
    Expression<int> tokenno,
    Expression<int> doctorid,
    Expression<DateTime> tokentime,
    Expression<String> name,
    Expression<int> age,
    Expression<String> address,
    Expression<int> mobileno,
    Expression<String> appointmenttype,
    Expression<String> visittype,
    Expression<String> bookedtype,
    Expression<int> fees,
    Expression<bool> cancelled,
    Expression<bool> booked,
    Expression<DateTime> updatedAt,
    Expression<bool> isOnline,
    Expression<String> guid,
    Expression<String> gender,
    Expression<bool> shift,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tokenno != null) 'tokenno': tokenno,
      if (doctorid != null) 'doctorid': doctorid,
      if (tokentime != null) 'tokentime': tokentime,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (address != null) 'address': address,
      if (mobileno != null) 'mobileno': mobileno,
      if (appointmenttype != null) 'appointmenttype': appointmenttype,
      if (visittype != null) 'visittype': visittype,
      if (bookedtype != null) 'bookedtype': bookedtype,
      if (fees != null) 'fees': fees,
      if (cancelled != null) 'cancelled': cancelled,
      if (booked != null) 'booked': booked,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isOnline != null) 'is_online': isOnline,
      if (guid != null) 'guid': guid,
      if (gender != null) 'gender': gender,
      if (shift != null) 'shift': shift,
    });
  }

  TokensCompanion copyWith(
      {Value<int> id,
      Value<int> tokenno,
      Value<int> doctorid,
      Value<DateTime> tokentime,
      Value<String> name,
      Value<int> age,
      Value<String> address,
      Value<int> mobileno,
      Value<String> appointmenttype,
      Value<String> visittype,
      Value<String> bookedtype,
      Value<int> fees,
      Value<bool> cancelled,
      Value<bool> booked,
      Value<DateTime> updatedAt,
      Value<bool> isOnline,
      Value<String> guid,
      Value<String> gender,
      Value<bool> shift}) {
    return TokensCompanion(
      id: id ?? this.id,
      tokenno: tokenno ?? this.tokenno,
      doctorid: doctorid ?? this.doctorid,
      tokentime: tokentime ?? this.tokentime,
      name: name ?? this.name,
      age: age ?? this.age,
      address: address ?? this.address,
      mobileno: mobileno ?? this.mobileno,
      appointmenttype: appointmenttype ?? this.appointmenttype,
      visittype: visittype ?? this.visittype,
      bookedtype: bookedtype ?? this.bookedtype,
      fees: fees ?? this.fees,
      cancelled: cancelled ?? this.cancelled,
      booked: booked ?? this.booked,
      updatedAt: updatedAt ?? this.updatedAt,
      isOnline: isOnline ?? this.isOnline,
      guid: guid ?? this.guid,
      gender: gender ?? this.gender,
      shift: shift ?? this.shift,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tokenno.present) {
      map['tokenno'] = Variable<int>(tokenno.value);
    }
    if (doctorid.present) {
      map['doctorid'] = Variable<int>(doctorid.value);
    }
    if (tokentime.present) {
      map['tokentime'] = Variable<DateTime>(tokentime.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (mobileno.present) {
      map['mobileno'] = Variable<int>(mobileno.value);
    }
    if (appointmenttype.present) {
      map['appointmenttype'] = Variable<String>(appointmenttype.value);
    }
    if (visittype.present) {
      map['visittype'] = Variable<String>(visittype.value);
    }
    if (bookedtype.present) {
      map['bookedtype'] = Variable<String>(bookedtype.value);
    }
    if (fees.present) {
      map['fees'] = Variable<int>(fees.value);
    }
    if (cancelled.present) {
      map['cancelled'] = Variable<bool>(cancelled.value);
    }
    if (booked.present) {
      map['booked'] = Variable<bool>(booked.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<bool>(isOnline.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (shift.present) {
      map['shift'] = Variable<bool>(shift.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TokensCompanion(')
          ..write('id: $id, ')
          ..write('tokenno: $tokenno, ')
          ..write('doctorid: $doctorid, ')
          ..write('tokentime: $tokentime, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('address: $address, ')
          ..write('mobileno: $mobileno, ')
          ..write('appointmenttype: $appointmenttype, ')
          ..write('visittype: $visittype, ')
          ..write('bookedtype: $bookedtype, ')
          ..write('fees: $fees, ')
          ..write('cancelled: $cancelled, ')
          ..write('booked: $booked, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isOnline: $isOnline, ')
          ..write('guid: $guid, ')
          ..write('gender: $gender, ')
          ..write('shift: $shift')
          ..write(')'))
        .toString();
  }
}

class $TokensTable extends Tokens with TableInfo<$TokensTable, Token> {
  final GeneratedDatabase _db;
  final String _alias;
  $TokensTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _tokennoMeta = const VerificationMeta('tokenno');
  GeneratedIntColumn _tokenno;
  @override
  GeneratedIntColumn get tokenno => _tokenno ??= _constructTokenno();
  GeneratedIntColumn _constructTokenno() {
    return GeneratedIntColumn(
      'tokenno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _doctoridMeta = const VerificationMeta('doctorid');
  GeneratedIntColumn _doctorid;
  @override
  GeneratedIntColumn get doctorid => _doctorid ??= _constructDoctorid();
  GeneratedIntColumn _constructDoctorid() {
    return GeneratedIntColumn(
      'doctorid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tokentimeMeta = const VerificationMeta('tokentime');
  GeneratedDateTimeColumn _tokentime;
  @override
  GeneratedDateTimeColumn get tokentime => _tokentime ??= _constructTokentime();
  GeneratedDateTimeColumn _constructTokentime() {
    return GeneratedDateTimeColumn(
      'tokentime',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
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

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _mobilenoMeta = const VerificationMeta('mobileno');
  GeneratedIntColumn _mobileno;
  @override
  GeneratedIntColumn get mobileno => _mobileno ??= _constructMobileno();
  GeneratedIntColumn _constructMobileno() {
    return GeneratedIntColumn(
      'mobileno',
      $tableName,
      true,
    );
  }

  final VerificationMeta _appointmenttypeMeta =
      const VerificationMeta('appointmenttype');
  GeneratedTextColumn _appointmenttype;
  @override
  GeneratedTextColumn get appointmenttype =>
      _appointmenttype ??= _constructAppointmenttype();
  GeneratedTextColumn _constructAppointmenttype() {
    return GeneratedTextColumn(
      'appointmenttype',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visittypeMeta = const VerificationMeta('visittype');
  GeneratedTextColumn _visittype;
  @override
  GeneratedTextColumn get visittype => _visittype ??= _constructVisittype();
  GeneratedTextColumn _constructVisittype() {
    return GeneratedTextColumn(
      'visittype',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bookedtypeMeta = const VerificationMeta('bookedtype');
  GeneratedTextColumn _bookedtype;
  @override
  GeneratedTextColumn get bookedtype => _bookedtype ??= _constructBookedtype();
  GeneratedTextColumn _constructBookedtype() {
    return GeneratedTextColumn(
      'bookedtype',
      $tableName,
      true,
    );
  }

  final VerificationMeta _feesMeta = const VerificationMeta('fees');
  GeneratedIntColumn _fees;
  @override
  GeneratedIntColumn get fees => _fees ??= _constructFees();
  GeneratedIntColumn _constructFees() {
    return GeneratedIntColumn(
      'fees',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cancelledMeta = const VerificationMeta('cancelled');
  GeneratedBoolColumn _cancelled;
  @override
  GeneratedBoolColumn get cancelled => _cancelled ??= _constructCancelled();
  GeneratedBoolColumn _constructCancelled() {
    return GeneratedBoolColumn('cancelled', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _bookedMeta = const VerificationMeta('booked');
  GeneratedBoolColumn _booked;
  @override
  GeneratedBoolColumn get booked => _booked ??= _constructBooked();
  GeneratedBoolColumn _constructBooked() {
    return GeneratedBoolColumn('booked', $tableName, false,
        defaultValue: Constant(false));
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

  final VerificationMeta _isOnlineMeta = const VerificationMeta('isOnline');
  GeneratedBoolColumn _isOnline;
  @override
  GeneratedBoolColumn get isOnline => _isOnline ??= _constructIsOnline();
  GeneratedBoolColumn _constructIsOnline() {
    return GeneratedBoolColumn('is_online', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn(
      'guid',
      $tableName,
      true,
    );
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedTextColumn _gender;
  @override
  GeneratedTextColumn get gender => _gender ??= _constructGender();
  GeneratedTextColumn _constructGender() {
    return GeneratedTextColumn(
      'gender',
      $tableName,
      true,
    );
  }

  final VerificationMeta _shiftMeta = const VerificationMeta('shift');
  GeneratedBoolColumn _shift;
  @override
  GeneratedBoolColumn get shift => _shift ??= _constructShift();
  GeneratedBoolColumn _constructShift() {
    return GeneratedBoolColumn('shift', $tableName, false,
        defaultValue: Constant(true));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        tokenno,
        doctorid,
        tokentime,
        name,
        age,
        address,
        mobileno,
        appointmenttype,
        visittype,
        bookedtype,
        fees,
        cancelled,
        booked,
        updatedAt,
        isOnline,
        guid,
        gender,
        shift
      ];
  @override
  $TokensTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tokens';
  @override
  final String actualTableName = 'tokens';
  @override
  VerificationContext validateIntegrity(Insertable<Token> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('tokenno')) {
      context.handle(_tokennoMeta,
          tokenno.isAcceptableOrUnknown(data['tokenno'], _tokennoMeta));
    } else if (isInserting) {
      context.missing(_tokennoMeta);
    }
    if (data.containsKey('doctorid')) {
      context.handle(_doctoridMeta,
          doctorid.isAcceptableOrUnknown(data['doctorid'], _doctoridMeta));
    } else if (isInserting) {
      context.missing(_doctoridMeta);
    }
    if (data.containsKey('tokentime')) {
      context.handle(_tokentimeMeta,
          tokentime.isAcceptableOrUnknown(data['tokentime'], _tokentimeMeta));
    } else if (isInserting) {
      context.missing(_tokentimeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age'], _ageMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    }
    if (data.containsKey('mobileno')) {
      context.handle(_mobilenoMeta,
          mobileno.isAcceptableOrUnknown(data['mobileno'], _mobilenoMeta));
    }
    if (data.containsKey('appointmenttype')) {
      context.handle(
          _appointmenttypeMeta,
          appointmenttype.isAcceptableOrUnknown(
              data['appointmenttype'], _appointmenttypeMeta));
    }
    if (data.containsKey('visittype')) {
      context.handle(_visittypeMeta,
          visittype.isAcceptableOrUnknown(data['visittype'], _visittypeMeta));
    }
    if (data.containsKey('bookedtype')) {
      context.handle(
          _bookedtypeMeta,
          bookedtype.isAcceptableOrUnknown(
              data['bookedtype'], _bookedtypeMeta));
    }
    if (data.containsKey('fees')) {
      context.handle(
          _feesMeta, fees.isAcceptableOrUnknown(data['fees'], _feesMeta));
    } else if (isInserting) {
      context.missing(_feesMeta);
    }
    if (data.containsKey('cancelled')) {
      context.handle(_cancelledMeta,
          cancelled.isAcceptableOrUnknown(data['cancelled'], _cancelledMeta));
    }
    if (data.containsKey('booked')) {
      context.handle(_bookedMeta,
          booked.isAcceptableOrUnknown(data['booked'], _bookedMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    if (data.containsKey('is_online')) {
      context.handle(_isOnlineMeta,
          isOnline.isAcceptableOrUnknown(data['is_online'], _isOnlineMeta));
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid'], _guidMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender'], _genderMeta));
    }
    if (data.containsKey('shift')) {
      context.handle(
          _shiftMeta, shift.isAcceptableOrUnknown(data['shift'], _shiftMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Token map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Token.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TokensTable createAlias(String alias) {
    return $TokensTable(_db, alias);
  }
}

abstract class _$TokenDB extends GeneratedDatabase {
  _$TokenDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TokensTable _tokens;
  $TokensTable get tokens => _tokens ??= $TokensTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tokens];
}
