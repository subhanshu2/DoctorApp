import 'dart:io';
import 'package:getcure_doctor/Models/PatientsVisitTableModels.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'SymptomsTable.g.dart';

enum Type { BriefHistory, VisitReason }
enum VisibilityPeriod {
  OneMonth,
  ThreeMonth,
  SixMonth,
  OneYear,
  FiveYear,
  Always
}

class Symptoms extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clinicDoctorId => integer()();
  IntColumn get doctorId => integer()();
  TextColumn get title => text()();
  IntColumn get type => intEnum<Type>()();
  IntColumn get visibilityPeriod => intEnum<VisibilityPeriod>()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  BoolColumn get isOnline => boolean().withDefault(Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'getSymptoms.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Symptoms])
class SymptomsDB extends _$SymptomsDB {
  SymptomsDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  //Fetching Data
  Stream<List<Symptom>> watchAllbookedTasks() => select(symptoms).watch();
  Future<List<Symptom>> watchAll() => select(symptoms).get();
  Stream<List<Symptom>> watchAllTasks(String q) {
    dynamic query;
    if (q.length != 0) {
      query = select(symptoms)..where((t) => t.title.contains(q));
    } else {
      query = select(symptoms);
    }
    return query.watch();
  }

  Stream<List<Symptom>> watchAllVisitTasks(String q) {
    dynamic query;
    if (q.length != 0) {
      query = select(symptoms)
        ..where((t) => t.title.contains(q))
        ..where((t) => t.type.equals(1));
    } else {
      query = select(symptoms);
    }
    return query.watch();
  }

  Future<List<Symptom>> watchAllTask(String q) {
    dynamic query;
    if (q.length != 0) {
      query = select(symptoms)..where((t) => t.title.equals(q));
    } else {
      query = select(symptoms);
    }
    return query.get();
  }

  //Inserting Data
  void addBrief(String name, VisibilityPeriod period, int docId) async {
    Symptom object = Symptom(
      doctorId: docId,
      clinicDoctorId: 1,
      type: Type.BriefHistory,
      title: name,
      visibilityPeriod: period,
    );
    var q = await watchAllTask(name);
    if (q.length == 0) {
      into(symptoms).insert(object);
    } else {
      print('Already Exists in table');
    }
  }

  Future deleteallTask() => delete(symptoms).go();

  //Inserting Data
  void addVisit(String name, VisibilityPeriod period, int docId) async {
    Symptom object = Symptom(
      doctorId: docId,
      clinicDoctorId: 1,
      type: Type.VisitReason,
      title: name,
      visibilityPeriod: period,
    );
    var q = await watchAllTask(name);
    if (q.length == 0) {
      into(symptoms).insert(object);
    } else {
      print('Already Exists in table');
    }
  }

  void addBriefHTTP(String name, int docID) async {
    Symptom object = Symptom(
        doctorId: docID,
        clinicDoctorId: 1,
        type: Type.BriefHistory,
        title: name,
        isOnline: true,
        visibilityPeriod: VisibilityPeriod.Always);

    var q = await watchAllTask(name);
    if (q.length == 0) {
      into(symptoms).insert(object);
    } else {
      print('Already Exists in table');
    }
  }

  void addVisitHTTP(String name, int docId) async {
    Symptom object = Symptom(
        doctorId: docId,
        clinicDoctorId: 1,
        type: Type.VisitReason,
        title: name,
        isOnline: true,
        visibilityPeriod: VisibilityPeriod.Always);

    var q = await watchAllTask(name);
    if (q.length == 0) {
      into(symptoms).insert(object);
    } else {
      print('Already Exists in table');
    }
  }
}
