import 'dart:io';
import 'package:getcure_doctor/Models/TokenMode.dart';
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
  
  Future<List<String>> showFamily(dynamic p) async
  {
    List<String> names = [];
    for(patients in p)
    {
      names.add(patients.patientId.toString());
    }
    return names;
  }

  Future<List<Patient>> showFamilyPatient(int mobileNo) async
  {
    String mob = mobileNo.toString();
    dynamic ans =  select(patients)..where((u) => u.patientId.contains(mob));
    return ans.get();
  }

  Future<Patient> createPatient(int mobileNo,String name) async{
    String unique_id = "A"+mobileNo.toString();
    var family = await this.showFamilyPatient(mobileNo);
    var unique_ids = await this.showFamily(family);
    List<String> names = await family.map((e) => e.name);
    if(names.indexOf(name) !=-1 ) {
      return family[names.indexOf(name)];
    }
    
  int len = unique_ids.length;
     int char = int.parse(unique_id[0]);
     unique_id = unique_id.replaceAll(String.fromCharCode(char), String.fromCharCode(char + len));
     
      //return create
     }
  }