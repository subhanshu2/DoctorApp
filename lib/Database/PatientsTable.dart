import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'PatientsTable.g.dart';

enum Gender { Male, Female }

class Patients extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get mobileNo => integer()();
  IntColumn get age => integer().nullable()();
  TextColumn get name => text()();
  IntColumn get gender => intEnum<Gender>()();
  TextColumn get address => text().nullable()();
  TextColumn get patientId => text()();
  IntColumn get clinicDoctorId => integer().nullable()();
  BoolColumn get isOnline => boolean().withDefault(Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'getcure.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Patients])
class PatientsDB extends _$PatientsDB {
  PatientsDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  Future<List<Patient>> showFamilyPatient(int mobileNo) async
{
  String mob = mobileNo.toString();
  dynamic ans =  select(patients)..where((u) => u.patientId.contains(mob));
  return ans.get();
}

}
