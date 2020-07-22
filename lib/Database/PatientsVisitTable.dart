import 'dart:io';
import 'package:getcure_doctor/Models/PatientsVisitTableModels.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'PatientsVisitTable.g.dart';

class PatientsVisit extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get mobileNo => integer()();
  IntColumn get age => integer().nullable()();
  TextColumn get patientName => text()();
  IntColumn get temperature => integer().withDefault(Constant(98))();
  IntColumn get pulse => integer().withDefault(Constant(60))();
  IntColumn get weight => integer().nullable()();
  TextColumn get patientId => text()();
  IntColumn get clinicDoctorId => integer().nullable()();
  TextColumn get briefHistory =>
      text().map(const BriefHistoryConverter()).nullable()();
  TextColumn get visitReason =>
      text().map(const VisitReasonConverter()).nullable()();
  TextColumn get examination =>
      text().map(const ExaminationConverter()).nullable()();
  TextColumn get diagnosis =>
      text().map(const DignosisConverter()).nullable()();
  TextColumn get medication =>
      text().map(const MedicationConverter()).nullable()();
  TextColumn get allergies => text().nullable()();
  TextColumn get lifestyle => text().nullable()();
  BoolColumn get isOnline => boolean().withDefault(Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'getPatientVisit.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [PatientsVisit])
class PatientsVisitDB extends _$PatientsVisitDB {
  PatientsVisitDB() : super(_openConnection());
  @override
  int get schemaVersion => 2;
  Future insert(PatientsVisitData p) => into(patientsVisit).insert(p);
  Future<List<PatientsVisitData>> checkPatient(String patientId) {
    try {
      var query = select(patientsVisit)
        ..where((pat) => pat.patientId.equals(patientId));
      return query.get();
    } catch (e) {
      print("Error" + e);
      return null;
    }
  }

  //Updating Data
  Future updateBriefHistory(PatientsVisitData data, BriefHistorygenerated bh) {
    var query = update(patientsVisit)..where((t) => t.id.equals(data.id));
    return query.write(PatientsVisitCompanion(briefHistory: Value(bh)));
  }
  //Fetch Data
  Stream<List<PatientsVisitData>> getBriefHistory(String id) {
    dynamic query;
    query = select(patientsVisit)..where((tbl) => tbl.patientId.equals(id));
    return query.watch();
  }
}
