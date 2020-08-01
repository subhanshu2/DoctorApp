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
  TextColumn get allergies => text().map(const AllergyConverter()).nullable()();
  TextColumn get lifestyle =>  text().map(const LifeStyleConverter()).nullable()();
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
    List<BriefHistoryData> list = [];
    // list = data.briefHistory.data;
    if (data.briefHistory != null) {
      list = data.briefHistory.data;
    }
    var res = list.where((element) => element.title == bh.data[0].title);
    if (res.length == 0) {
      list.add(bh.data[0]);
      bh.data = list;
    } else {
      bh.data = list;
    }

    return query.write(PatientsVisitCompanion(briefHistory: Value(bh)));
  }

  //Fetch Data
  Stream<List<PatientsVisitData>> getBriefHistory(String id) {
    dynamic query;
    query = select(patientsVisit)..where((tbl) => tbl.patientId.equals(id));
    return query.watch();
  }

  //delete briefhistory
  Future deleteBrief(PatientsVisitData pvd, String title) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    List<BriefHistoryData> list = [];
    pvd.briefHistory.data.removeWhere((element) => element.title == title);
    // if (pvd.briefHistory != null) {
    //   list = pvd.briefHistory.data;
    // }
    // var res = list.where((element) => element.title == title);
    // if (res.length == 0) {
    //   list.add(bh.data[0]);
    //   bh.data = list;
    // } else {
    //   bh.data = list;
    // }

    return query
        .write(PatientsVisitCompanion(briefHistory: Value(pvd.briefHistory)));
  }

  Future updateVisitReason(PatientsVisitData data, VisitReasongenerated vh) {
    var query = update(patientsVisit)..where((t) => t.id.equals(data.id));
    List<VisitReasonData> list = [];
    // list = data.briefHistory.data;
    if (data.visitReason != null) {
      list = data.visitReason.data;
    }
    var res = list.where((element) => element.title == vh.data[0].title);
    if (res.length == 0) {
      list.add(vh.data[0]);
      vh.data = list;
    } else {
      vh.data = list;
    }

    return query.write(PatientsVisitCompanion(visitReason: Value(vh)));
  }

  Stream<List<PatientsVisitData>> getVisitReason(String id) {
    dynamic query;
    query = select(patientsVisit)..where((tbl) => tbl.patientId.equals(id));
    return query.watch();
  }
}
