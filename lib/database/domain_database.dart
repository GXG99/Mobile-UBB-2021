import 'dart:core';

import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trivia_game/domain/domain.dart';

class DomainDatabase {
  static final DomainDatabase instance = DomainDatabase._init();
  static final Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  static Database _database;

  DomainDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('domains.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    logger.i('Creating db {$db}, version {$version}');

    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableDomains (
    ${DomainFields.id} $idType,
    ${DomainFields.title} $textType,
    ${DomainFields.description} $textType
    )
    ''');
  }

  Future<Domain> create(Domain domain) async {
    final db = await instance.database;
    final id = await db.insert(tableDomains, domain.toJson());
    domain.id = id;
    var json = domain.toJson();
    logger.i('Adding domain $json');
    return domain.copy(id: id);
  }

  Future<Domain> readDomain(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDomains,
      columns: DomainFields.values,
      where: '${DomainFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      logger.i('Domain found with id = $id. Found domain: ${maps.first}');
      return Domain.fromJson(maps.first);
    } else {
      logger.w('Domain with id $id was not found');
      throw Exception('ID $id was not found');
    }
  }

  Future<List<Domain>> readAllDomains() async {
    final db = await instance.database;

    final result = await db.query(tableDomains);

    logger.i('Reading all domains $result');

    return result.map((json) => Domain.fromJson(json)).toList();
  }

  Future<int> update(Domain domain) async {
    final db = await instance.database;
    logger.i('Updating domain ${domain.toJson()}');
    return db.update(
      tableDomains,
      domain.toJson(),
      where: '${DomainFields.id} = ?',
      whereArgs: [domain.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    logger.i('Deleting domain with id: $id}');
    return await db.delete(
      tableDomains,
      where: '${DomainFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    logger.i('Closing database');
    final db = await instance.database;
    db.close();
  }
}
