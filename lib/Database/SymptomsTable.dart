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
    if (q.length!=0) {
      query = select(symptoms)..where((t) => t.title.contains(q));
    } else {
      query = select(symptoms);
    }
    return query.watch();
  }
  //Inserting Data
  Future addBrief(String name, VisibilityPeriod period) {
    Symptom object = Symptom(
      doctorId: 2,
      clinicDoctorId: 1,
      type: Type.BriefHistory,
      title: name,
      visibilityPeriod: period,
    );

    into(symptoms).insert(object);
  }

  
}
