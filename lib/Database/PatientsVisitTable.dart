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
  IntColumn get bp => integer().withDefault(Constant(72))();
  IntColumn get pulse => integer().withDefault(Constant(60))();
  IntColumn get weight => integer().withDefault(Constant(50))();
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
  TextColumn get lifestyle =>
      text().map(const LifeStyleConverter()).nullable()();
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
        ..where((pat) => pat.patientId.equals(patientId))
        ..limit(1);
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
    // List<DignosisData> listd = [];
    // if (data.diagnosis != null) {
    //   listd = data.diagnosis.data;
    // }
    // var resd = listd.where((element) => element.title == bh.data[0].title);
    if (data.briefHistory != null) {
      list = data.briefHistory.data;
    }
    var res = list.where((element) => element.title == bh.data[0].title);
    // if (res.length == 0) {
    //   list.add(bh.data[0]);
    //   bh.data = list;
    // } else {
    //   bh.data = list;
    // }
    if (res.length == 0) {
      list.add(bh.data[0]);
      bh.data = list;
    } else {
      bh.data = list;
    }
    return query.write(PatientsVisitCompanion(briefHistory: Value(bh)));
  }

  Future updateDiagnosis(PatientsVisitData data, Dignosisgenerated bh) {
    var query = update(patientsVisit)..where((t) => t.id.equals(data.id));
    List<DignosisData> list = [];
    // list = data.briefHistory.data;
    if (data.diagnosis != null) {
      list = data.diagnosis.data;
    }
    var res = list.where((element) => element.title == bh.data[0].title);
    if (res.length == 0) {
      list.add(bh.data[0]);
      bh.data = list;
    } else {
      bh.data = list;
    }
    return query.write(PatientsVisitCompanion(diagnosis: Value(bh)));
  }

  Future updateExamination(PatientsVisitData data, Examinationgenerated ex) {
    var query = update(patientsVisit)..where((t) => t.id.equals(data.id));
    List<ExaminationData> list = [];
    // list = data.briefHistory.data;
    if (data.examination != null) {
      list = data.examination.data;
    }
    var res = list.where((element) => element.title == ex.data[0].title);
    if (res.length == 0) {
      list.add(ex.data[0]);
      ex.data = list;
    } else {
      ex.data = list;
    }
    return query.write(PatientsVisitCompanion(examination: Value(ex)));
  }

  //Fetch Data
  Stream<List<PatientsVisitData>> getBriefHistory(String id) {
    dynamic query;
    query = select(patientsVisit)..where((tbl) => tbl.patientId.equals(id));
    return query.watch();
  }

  Future<List<PatientsVisitData>> getDiagnosis(String id) {
    dynamic query;
    query = select(patientsVisit)..where((tbl) => tbl.patientId.equals(id));
    return query.get();
  }

  //delete briefhistory
  Future deleteBrief(PatientsVisitData pvd, String title) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    pvd.briefHistory.data.removeWhere((element) => element.title == title);

    return query
        .write(PatientsVisitCompanion(briefHistory: Value(pvd.briefHistory)));
  }

  Future deleteExam(PatientsVisitData pvd, String title) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    pvd.examination.data.removeWhere((element) => element.title == title);
    return query
        .write(PatientsVisitCompanion(examination: Value(pvd.examination)));
  }

  Future deleteDiagnosis(PatientsVisitData pvd, String title) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    pvd.diagnosis.data.removeWhere((element) => element.title == title);

    return query.write(PatientsVisitCompanion(diagnosis: Value(pvd.diagnosis)));
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

  Future deleteVisit(PatientsVisitData pvd, String title) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    List<VisitReasonData> list = [];
    pvd.visitReason.data.removeWhere((element) => element.title == title);

    return query
        .write(PatientsVisitCompanion(visitReason: Value(pvd.visitReason)));
  }

  Stream<List<PatientsVisitData>> getAllergies(String id) {
    dynamic query;
    query = select(patientsVisit)..where((tbl) => tbl.patientId.equals(id));
    return query.watch();
  }

  Future updateAllergy(PatientsVisitData data, Allergy bh) {
    var query = update(patientsVisit)..where((t) => t.id.equals(data.id));
    List<AllergyData> list = [];
    // list = data.briefHistory.data;
    if (data.allergies != null) {
      list = data.allergies.data;
    }
    var res = list.where((element) => element.title == bh.data[0].title);
    if (res.length == 0) {
      list.add(bh.data[0]);
      bh.data = list;
    } else {
      bh.data = list;
    }

    return query.write(PatientsVisitCompanion(allergies: Value(bh)));
  }

  Future deleteallergy(PatientsVisitData pvd, String title) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    List<AllergyData> list = [];
    pvd.allergies.data.removeWhere((element) => element.title == title);

    return query.write(PatientsVisitCompanion(allergies: Value(pvd.allergies)));
  }

  Stream<List<PatientsVisitData>> getLifeStyle(String id) {
    dynamic query;
    query = select(patientsVisit)..where((tbl) => tbl.patientId.equals(id));
    return query.watch();
  }

  Future updateLifeStyle(PatientsVisitData data, LifeStyle bh) {
    var query = update(patientsVisit)..where((t) => t.id.equals(data.id));
    List<LifeStyleData> list = [];
    // list = data.briefHistory.data;
    if (data.lifestyle != null) {
      list = data.lifestyle.data;
    }
    var res = list.where((element) => element.title == bh.data[0].title);
    if (res.length == 0) {
      list.add(bh.data[0]);
      bh.data = list;
    } else {
      bh.data = list;
    }

    return query.write(PatientsVisitCompanion(lifestyle: Value(bh)));
  }

  Future deleteLifeStyle(PatientsVisitData pvd, String title) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    List<LifeStyleData> list = [];
    pvd.lifestyle.data.removeWhere((element) => element.title == title);

    return query.write(PatientsVisitCompanion(lifestyle: Value(pvd.lifestyle)));
  }

  void updateTemp(PatientsVisitData pvd, String temp) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    query.write(PatientsVisitCompanion(temperature: Value(int.parse(temp))));
  }

  void updateBP(PatientsVisitData pvd, String bp) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    query.write(PatientsVisitCompanion(bp: Value(int.parse(bp))));
  }

  void updatePulse(PatientsVisitData pvd, String pulse) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    query.write(PatientsVisitCompanion(pulse: Value(int.parse(pulse))));
  }

  void updateWeight(PatientsVisitData pvd, String weight) {
    var query = update(patientsVisit)..where((t) => t.id.equals(pvd.id));
    query.write(PatientsVisitCompanion(weight: Value(int.parse(weight))));
  }
}
