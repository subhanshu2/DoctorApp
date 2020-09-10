import 'dart:io';
import 'package:getcure_doctor/Database/FeedBackTable.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'MedicinesTable.g.dart';

class Medicines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clinicDoctorId => integer()();
  IntColumn get doctorId => integer()();
  TextColumn get title => text()();
  TextColumn get defaultUnit => text()();
  TextColumn get defaultRoute => text()();
  TextColumn get defaultFrequency => text()();
  TextColumn get defaultDirection => text()();
  TextColumn get defaultDuration => text()();
  TextColumn get salt => text()();
  TextColumn get interactionDrugs => text()();
  TextColumn get category => text()();
  TextColumn get defaultDose => text()();
  BoolColumn get isOnline => boolean().withDefault(Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'getMedicines.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Medicines])
class MedicinesDB extends _$MedicinesDB {
  MedicinesDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;
    Future insert(Medicine m) => into(medicines).insert(m);
     Stream<List<Medicine>> watchAllTask(String q) {
    dynamic query;
    if (q.length != 0) {
      query = select(medicines)..where((t) => t.title.like("%$q%"));
    } else {
      query = select(medicines);
    }
    return query.watch();
  }

}
