import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class DbDockets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();
}

@UseDao(tables: [DbDockets])
class DbDocketsDao extends DatabaseAccessor<AppDatabase>
    with _$DbDocketsDaoMixin {
  final AppDatabase appDb;

  DbDocketsDao(this.appDb) : super(appDb);

  Future<List<DbDocket>> getAllDbDockets() => select(dbDockets).get();

  Stream<List<DbDocket>> watchAllDbDockets() => select(dbDockets).watch();

  Future insertDbDocket(Insertable<DbDocket> dbDocket) =>
      into(dbDockets).insert(dbDocket);

  Future updateDbDocket(Insertable<DbDocket> dbDocket) =>
      update(dbDockets).replace(dbDocket);

  Future deleteDbDocket(Insertable<DbDocket> dbDocket) =>
      delete(dbDockets).delete(dbDocket);
}

@UseMoor(tables: [DbDockets], daos: [DbDocketsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'docketsdb.sqlite',
          logStatements: true,
        ));
  @override
  int get schemaVersion => 1;
}
