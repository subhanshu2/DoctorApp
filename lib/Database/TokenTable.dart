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
  IntColumn get clinicid => integer()();
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
    final file = File(p.join(dbFolder.path, 'getToken.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Tokens])
class TokenDB extends _$TokenDB {
  TokenDB() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<List<Token>> getAllTasks(DateTime time,int clinicId) {
    final query = select(tokens)
      ..where((t) => t.tokentime.day.equals(time.day))
      ..where((tbl) => tbl.clinicid.equals(clinicId))
      ..where((t) => t._booked.equals(false));
    return query.get();
  }

  Stream<List<Token>> watchAllTasks(String q) {
    dynamic query;

    if (q.isNotEmpty) {
      query = select(tokens)
        ..where((t) => t.name.contains(q) | t.address.contains(q))
        ..where((t) => (t.booked.equals(true) |
            t.cancelled.equals(true) &
                t.tokentime.day.isBiggerOrEqualValue(DateTime.now().day)));
    } else {
      query = select(tokens)
        ..where((t) => t.booked.equals(true) | t.cancelled.equals(true));
    }
    return query.watch();
  }

  Stream<List<Token>> watchAllbookedTasks() {
    dynamic query;
    query = select(tokens)..where((t) => t.booked.equals(true));
    // ..where((t) => t.tokentime.isBiggerOrEqualValue(DateTime.now()));

    return query.watch();
  }

  Future<int> allBooked() async {
    final query = select(tokens)..where((t) => t.booked.equals(true));
    print(await query.watch().length);
    return query.watch().length;
  }

  Future<int> frontDesk() {
    final query = select(tokens)
      ..where((t) => t.booked.equals(true))
      ..where((p) => p.bookedtype.equals('walk in'));
    return query.watch().length;
  }

  Stream<List<Token>> watchondate(DateTime time,int clinicId) {
    final query = select(tokens)
      ..where((t) => t.tokentime.day.equals(time.day))
      ..where((t) => t.booked.equals(false))
      ..where((tbl) => tbl.clinicid.equals(clinicId))
      ..where((t) => t.cancelled.equals(false));
    return query.watch();
  }

  Future insertTask(Token token) => into(tokens).insert(token);
  Future updateTask(Token token) => update(tokens).replace(token);
  Future updateData(Token token, String name) {
    print(name);
    var query = update(tokens)..where((t) => t.id.equals(token.id));
    return query.write(TokensCompanion(
        guid: Value(token.guid),
        gender: Value(token.gender),
        booked: Value(token.booked),
        cancelled: Value(token.cancelled),
        name: Value(token.name),
        address: Value(token.address),
        age: Value(token.age),
        fees: Value(token.fees),
        appointmenttype: Value(token.appointmenttype),
        visittype: Value(token.visittype),
        bookedtype: Value(token.bookedtype),
        mobileno: Value(token.mobileno)));
  }

  Future updateOnline(Token token) {
    var query = update(tokens)
      ..where((t) =>
          t.tokentime.equals(token.tokentime) &
          t.doctorid.equals(token.doctorid));
    return query.write(TokensCompanion(
        guid: Value(token.guid),
        updatedAt: Value(DateTime.now()),
        booked: Value(token.booked),
        cancelled: Value(token.cancelled),
        name: Value(token.name),
        address: Value(token.address),
        age: Value(token.age),
        fees: Value(token.fees),
        appointmenttype: Value(token.appointmenttype),
        visittype: Value(token.visittype),
        bookedtype: Value(token.bookedtype),
        mobileno: Value(token.mobileno)));
  }

  Future<int> getcount() async {
    final query = (await select(tokens).get()).where((t) => t.booked == true);
    return query.length;
  }

  Future<int> getcountoncall() async {
    final query = (await select(tokens).get())
        .where((t) => t.bookedtype == "on call")
        .where((t) => t.booked == true);
    return query.length;
  }

  Future<int> getcountonfront() async {
    final query = (await select(tokens).get())
        .where((t) => t.bookedtype == "walk in")
        .where((t) => t.booked == true);
    return query.length;
  }

  Future<int> getcountOnline() async {
    final query = (await select(tokens).get())
        .where((t) => t.isOnline == true)
        .where((t) => t.booked == true);
    return query.length;
  }

  Future<int> getcountPresent() async {
    final query = (await select(tokens).get()).where((t) => t.booked == true);
    return query.length;
  }

  Future deleteTask(Token token) => delete(tokens).delete(token);
  Future deleteallbydate(DateTime time) =>
      (delete(tokens)..where((t) => t.tokentime.isSmallerThanValue(time))).go();
  Future deleteallTask() => delete(tokens).go();
}
