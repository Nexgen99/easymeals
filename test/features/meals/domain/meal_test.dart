import 'package:easymeals/features/meals/domain/meal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Meal', () {
    test('converts to a SQLite-compatible map', () {
      const meal = Meal(
        id: 7,
        name: 'Pâté chinois',
        emoji: '🥘',
        category: 'Plat principal',
        ingredients: <String>['Bœuf haché', 'Maïs', 'Pommes de terre'],
      );

      expect(
        meal.toMap(),
        <String, Object?>{
          'id': 7,
          'name': 'Pâté chinois',
          'emoji': '🥘',
          'category': 'Plat principal',
          'ingredients':
              '["Bœuf haché","Maïs","Pommes de terre"]',
        },
      );
    });

    test('reconstructs a meal from a SQLite row', () {
      final meal = Meal.fromMap(
        <String, Object?>{
          'id': 7,
          'name': 'Pâté chinois',
          'emoji': '🥘',
          'category': 'Plat principal',
          'ingredients':
              '["Bœuf haché","Maïs","Pommes de terre"]',
        },
      );

      expect(
        meal,
        const Meal(
          id: 7,
          name: 'Pâté chinois',
          emoji: '🥘',
          category: 'Plat principal',
          ingredients: <String>[
            'Bœuf haché',
            'Maïs',
            'Pommes de terre',
          ],
        ),
      );
    });

    test('omits a null identifier when preparing an insertion', () {
      const meal = Meal(
        name: 'Tacos',
        emoji: '🌮',
        category: 'Plat principal',
      );

      expect(meal.toMap().containsKey('id'), isFalse);
    });
  });
}
