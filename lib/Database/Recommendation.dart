import 'dart:convert';
import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'Recommendation.g.dart';

class Recommendation extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clinicDoctorId => integer()();
  IntColumn get doctorId => integer()();
  TextColumn get disease => text()();
  IntColumn get totalCount => integer().withDefault(Constant(0))();
  IntColumn get cured => integer().withDefault(Constant(0))();
  IntColumn get partiallyCured => integer().withDefault(Constant(0))();
  IntColumn get notCured => integer().withDefault(Constant(0))();
  TextColumn get medicines =>
      text().map(const MedicinesConverter()).nullable()();
  IntColumn get symptomsIncreased => integer().withDefault(Constant(0))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  BoolColumn get isOnline => boolean().withDefault(Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'Recommendation.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Recommendation])
class RecommendationDB extends _$RecommendationDB {
  RecommendationDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  Future insert(RecommendationData p) => into(recommendation).insert(p);
  Future updateData(String disease, String feedback, List<String> med) async {
    var query = update(recommendation)
      ..where((tbl) => tbl.disease.equals(disease));
    List<RecommendationData> list = await check(disease);
    list.last.medicines.medicines.addAll(med);
    list.last.medicines.medicines=list.last.medicines.medicines.toSet().toList();
    RecommendationData newlist;
    switch (feedback) {
      case 'Cured Complete':
        newlist = list.last.copyWith(
          cured: list.last.cured + 1,
          totalCount: list.last.totalCount + 1,
          medicines: list.last.medicines,
        );
        break;
      case 'Partially Cured':
        newlist = list.last.copyWith(
          partiallyCured: list.last.partiallyCured + 1,
          medicines: list.last.medicines,
          totalCount: list.last.totalCount + 1,
        );
        break;
      case 'Not Cured':
        newlist = list.last.copyWith(
          notCured: list.last.notCured + 1,
          medicines: list.last.medicines,
          totalCount: list.last.totalCount + 1,
        );
        break;
      default:
        newlist = list.last.copyWith(
          symptomsIncreased: list.last.symptomsIncreased + 1,
          medicines: list.last.medicines,
          totalCount: list.last.totalCount + 1,
        );
    }

    list.removeLast();
    list.add(newlist);
    return query.write(RecommendationCompanion(
      clinicDoctorId: Value(newlist.clinicDoctorId),
      doctorId: Value(newlist.doctorId),
      cured: Value(newlist.cured),
      disease: Value(newlist.disease),
      id: Value(newlist.id),
      isOnline: Value(newlist.isOnline),
      createdAt: Value(newlist.createdAt),
      medicines: Value(newlist.medicines),
      notCured: Value(newlist.notCured),
      partiallyCured: Value(newlist.partiallyCured),
      symptomsIncreased: Value(newlist.symptomsIncreased),
      totalCount: Value(newlist.totalCount),
    ));
  }

  Future<List<RecommendationData>> check(String disease) {
    var query = select(recommendation)
      ..where((tbl) => tbl.disease.equals(disease));
    return query.get();
  }
}

class MedicinesConverter extends TypeConverter<Medicinesgenerated, String> {
  const MedicinesConverter();
  @override
  Medicinesgenerated mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Medicinesgenerated.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(Medicinesgenerated value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}

class Medicinesgenerated {
  List<String> medicines;

  Medicinesgenerated({this.medicines});

  Medicinesgenerated.fromJson(Map<String, dynamic> json) {
    medicines = json['medicines'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicines'] = this.medicines;
    return data;
  }
}
