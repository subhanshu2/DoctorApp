import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'MedicinesTable.g.dart';
enum DoseTime { Before, After }

class Medicines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clinicDoctorId => integer()();
  IntColumn get doctorId => integer()();
  TextColumn get title => text()();
  IntColumn get doseTime => intEnum<DoseTime>()();
  BoolColumn get isOnline => boolean().withDefault(Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'getcure.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Medicines])
class MedicinesDB extends _$MedicinesDB {
  MedicinesDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
