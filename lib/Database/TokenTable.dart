import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'TokenTable.g.dart';

class Tokens extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tokenno => integer()();
  IntColumn get doctorid => integer()();
  DateTimeColumn get tokentime => dateTime()();
  TextColumn get name => text().nullable()();
  IntColumn get age => integer().nullable()();
  TextColumn get address => text().nullable()();
  IntColumn get mobileno => integer().nullable()();
  TextColumn get appointmenttype => text().nullable()();
  TextColumn get visittype => text().nullable()();
  TextColumn get bookedtype => text().nullable()();
  IntColumn get fees => integer()();
  BoolColumn get cancelled => boolean().withDefault(Constant(false))();
  BoolColumn get booked => boolean().withDefault(Constant(false))();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  BoolColumn get isOnline => boolean().withDefault(Constant(false))();
  TextColumn get guid => text().nullable()();
  TextColumn get gender => text().nullable()();
  BoolColumn get shift => boolean().withDefault(Constant(true))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'getcure.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Tokens])
class TokenDB extends _$TokenDB {
  TokenDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
