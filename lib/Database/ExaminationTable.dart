import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'ExaminationTable.g.dart';

class Examinations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clinicDoctorId => integer()();
  IntColumn get doctorId => integer()();
  TextColumn get title => text()();
  TextColumn get parameters => text()();
  IntColumn get price => integer()();
  BoolColumn get isOnline => boolean().withDefault(Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'examinationsDBtable.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Examinations])
class ExaminationsDB extends _$ExaminationsDB {
  ExaminationsDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
