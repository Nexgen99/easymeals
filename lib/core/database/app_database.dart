import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

/// Point d'accès unique à la base de données SQLite d'Easy Meals.
class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static const String databaseName = 'easy_meals.db';
  static const int databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    return _database ??= await _openDatabase();
  }

  Future<Database> _openDatabase() async {
    final databaseDirectory = await getDatabasesPath();
    final databasePath = path.join(databaseDirectory, databaseName);

    return openDatabase(
      databasePath,
      version: databaseVersion,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: _createSchema,
    );
  }

  Future<void> _createSchema(Database database, int version) async {
    await database.execute('''
      CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        emoji TEXT NOT NULL,
        category TEXT NOT NULL,
        ingredients TEXT NOT NULL DEFAULT '[]'
      )
    ''');

    await database.execute('''
      CREATE TABLE weekly_meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        week_start TEXT NOT NULL,
        day_index INTEGER NOT NULL CHECK(day_index BETWEEN 0 AND 6),
        meal_id INTEGER NOT NULL,
        UNIQUE(week_start, day_index),
        FOREIGN KEY(meal_id) REFERENCES meals(id) ON DELETE RESTRICT
      )
    ''');

    await database.execute(
      'CREATE INDEX index_weekly_meals_week_start '
      'ON weekly_meals(week_start)',
    );
  }

  /// Ferme la base, principalement pour les tests et le développement.
  Future<void> close() async {
    final database = _database;
    if (database == null) {
      return;
    }

    await database.close();
    _database = null;
  }
}
