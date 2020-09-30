
import 'dart:convert';
import 'dart:io';
import 'package:getcure_doctor/Models/PatientsVisitTableModels.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'FeedBackTable.g.dart';

class FeedBack extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clinicDoctorId => integer()();
  IntColumn get doctorId => integer()();
  IntColumn get patientVisitIid => integer()();
  TextColumn get option => text()();
  TextColumn get question => text()();
  TextColumn get medication =>
      text().map(const FeedBackMedicationConverter()).nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'feedback.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [FeedBack])
class FeedBackDB extends _$FeedBackDB {
  FeedBackDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  Future insert(FeedBackData p) => into(feedBack).insert(p);
}

class FeedBackMedicationConverter extends TypeConverter<MedicationData, String> {
  const FeedBackMedicationConverter();
  @override
  MedicationData mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return MedicationData.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(MedicationData value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}


class Medication {
  int id;
  int doctorId;
  String title;
  String salt;
  String interactionDrugs;
  String category;
  String defaultDose;
  String defaultUnit;
  String defaultRoute;
  String defaultFrequency;
  String defaultDirection;
  String defaultDuration;
  dynamic createdAt;
  dynamic updatedAt;

  Medication(
      {this.id,
      this.doctorId,
      this.title,
      this.salt,
      this.interactionDrugs,
      this.category,
      this.defaultDose,
      this.defaultUnit,
      this.defaultRoute,
      this.defaultFrequency,
      this.defaultDirection,
      this.defaultDuration,
      this.createdAt,
      this.updatedAt});

  Medication.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    title = json['title'];
    salt = json['salt'];
    interactionDrugs = json['interaction_drugs'];
    category = json['category'];
    defaultDose = json['default_dose'];
    defaultUnit = json['default_unit'];
    defaultRoute = json['default_route'];
    defaultFrequency = json['default_frequency'];
    defaultDirection = json['default_direction'];
    defaultDuration = json['default_duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['title'] = this.title;
    data['salt'] = this.salt;
    data['interaction_drugs'] = this.interactionDrugs;
    data['category'] = this.category;
    data['default_dose'] = this.defaultDose;
    data['default_unit'] = this.defaultUnit;
    data['default_route'] = this.defaultRoute;
    data['default_frequency'] = this.defaultFrequency;
    data['default_direction'] = this.defaultDirection;
    data['default_duration'] = this.defaultDuration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
