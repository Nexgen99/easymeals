import 'package:sqflite/sqflite.dart';

import '../../domain/meal.dart';
import '../default_meals.dart';

/// Effectue les opérations de lecture et d'écriture des repas dans SQLite.
class MealRepository {
  const MealRepository(this._database);

  final Database _database;

  Future<List<Meal>> getAll() async {
    final rows = await _database.query('meals', orderBy: 'name COLLATE NOCASE');
    return rows.map(Meal.fromMap).toList(growable: false);
  }

  Future<Meal?> getById(int id) async {
    final rows = await _database.query(
      'meals',
      where: 'id = ?',
      whereArgs: <Object?>[id],
      limit: 1,
    );
    return rows.isEmpty ? null : Meal.fromMap(rows.first);
  }

  Future<Meal> create(Meal meal) async {
    final values = meal.toMap()..remove('id');
    final id = await _database.insert(
      'meals',
      values,
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
    return meal.copyWith(id: id);
  }

  Future<void> update(Meal meal) async {
    final id = meal.id;
    if (id == null) {
      throw ArgumentError.value(id, 'meal.id', 'Un identifiant est requis');
    }

    final values = meal.toMap()..remove('id');
    final changedRows = await _database.update(
      'meals',
      values,
      where: 'id = ?',
      whereArgs: <Object?>[id],
    );
    if (changedRows == 0) {
      throw StateError('Le repas $id est introuvable');
    }
  }

  Future<void> delete(int id) async {
    await _database.delete(
      'meals',
      where: 'id = ?',
      whereArgs: <Object?>[id],
    );
  }

  /// Ajoute les repas initiaux uniquement quand aucun repas n'existe.
  Future<void> seedDefaultsIfEmpty() async {
    final result = await _database.rawQuery(
      'SELECT COUNT(*) AS total FROM meals',
    );
    final total = Sqflite.firstIntValue(result) ?? 0;
    if (total > 0) {
      return;
    }

    final batch = _database.batch();
    for (final meal in defaultMeals) {
      batch.insert('meals', meal.toMap()..remove('id'));
    }
    await batch.commit(noResult: true);
  }
}
