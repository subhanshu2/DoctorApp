import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'MedicinesTable.g.dart';

/* 
{
 id               : {
        allowNull    : false,
        primaryKey   : true,
        autoIncrement: true,
        type         : Sequelize.BIGINT
      },
      clinic_doctor_id : {
        type      : Sequelize.BIGINT,
        allowNull : true,
        references: {
          model: "clinics_doctors",
          key  : "id"
        },
        onDelete  : "cascade"
      },
      doctor_id        : {
        type      : Sequelize.BIGINT,
        allowNull : false,
        references: {
          model: "doctors",
          key  : "id"
        },
        onDelete  : "cascade"
      },
      title            : {
        allowNull: false,
        type     : Sequelize.STRING
      },
      salt             : {
        allowNull: false,
        type     : Sequelize.STRING
      },
      interaction_drugs: {
        allowNull: false,
        type     : Sequelize.STRING
      },
      category         : {
        allowNull: false,
        type     : Sequelize.STRING
      },
      default_dose     : {
        allowNull: false,
        type     : Sequelize.STRING
      },
      default_unit     : {
        allowNull: false,
        type     : Sequelize.STRING
      },
      default_route    : {
        allowNull: false,
        type     : Sequelize.STRING
      },
      default_frequency: {
        allowNull: false,
        type     : Sequelize.STRING
      },
      default_direction: {
        allowNull: false,
        type     : Sequelize.STRING
      },
      default_duration : {
        allowNull: false,
        type     : Sequelize.STRING
      },
      createdAt        : {
        allowNull: true,
        type     : Sequelize.DATE
      },
      updatedAt        : {
        allowNull: true,
        type     : Sequelize.DATE
      }
*/


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
}
