import 'dart:convert';
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
    final file = File(p.join(dbFolder.path, 'getPatients.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Patients])
class PatientsDB extends _$PatientsDB {
  PatientsDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<List<String>> showFamily(dynamic p) async {
    List<String> names = [];
    for (var patients in p) {
      names.add(patients.patientId.toString());
    }
    return names;
  }

  Future<List<Patient>> showFamilyPatient(int mobileNo,String name) async {
    String mob = mobileNo.toString();
    dynamic ans = select(patients)..where((u) => u.patientId.like("%$mob") & u.name.equals(name));
    return ans.get();
  }

  Future<List<Patient>> getAll() {
    final query = select(patients);
    print(query);
    return query.get();
  }

  // Future<Patient> createPatient(int mobileNo, String name) async {
  //   String unique_id = "A" + mobileNo.toString();
  //   var family = await this.showFamilyPatient(mobileNo);
  //   var unique_ids = await this.showFamily(family);
  //   List<String> names = await family.map((e) => e.name);
  //   if (names.indexOf(name) != -1) {
  //     return family[names.indexOf(name)];
  //   }

  //   int len = unique_ids.length;
  //   int char = int.parse(unique_id[0]);
  //   unique_id = unique_id.replaceAll(
  //       String.fromCharCode(char), String.fromCharCode(char + len));

  //   //return create
  // }

  Future<List<Patient>> checkPatient(String patientId) {
    try {
      var query = select(patients)
        ..where((pat) => pat.patientId.contains(patientId));
      return query.get();
    } catch (e) {
      print("Error" + e);
      return null;
    }
  }

  Future createPatient2(Patient patient) async {
    String uniqueId = "A" + patient.mobileNo.toString();
    List<Patient> family = await this.showFamilyPatient(patient.mobileNo,patient.name);
    // var unique_ids = await this.showFamily(family);
    // List<String> names = await family.map((e) => e.name);
    // if (names.indexOf(patient.name) != -1) {
    //   print("If inside");
    //   return family[names.indexOf(patient.name)];
    // }
    // int len = unique_ids.length;
    String ch = uniqueId[0];
    uniqueId = uniqueId.replaceAll(
        ch, String.fromCharCode(ch.codeUnitAt(0) + family.length));
    Patient pat = Patient(
        mobileNo: patient.mobileNo,
        name: patient.name,
        gender: patient.gender,
        patientId: uniqueId,
        address: patient.address,
        age: patient.age);
    List<Patient> part = await checkPatient(pat.patientId);
    //  if (pat.patientId.toString() != part.patientId) {
    into(patients).insert(pat);
    // }
    return uniqueId;
  }
}
