import 'package:easymeals/features/meals/data/default_meals.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('defaultMeals', () {
    test('contains enough meals for two different weeks', () {
      expect(defaultMeals.length, greaterThanOrEqualTo(14));
    });

    test('contains unique names and complete grocery information', () {
      final names = defaultMeals.map((meal) => meal.name).toSet();

      expect(names.length, defaultMeals.length);
      for (final meal in defaultMeals) {
        expect(meal.name, isNotEmpty);
        expect(meal.emoji, isNotEmpty);
        expect(meal.category, isNotEmpty);
        expect(meal.ingredients, isNotEmpty);
        expect(meal.ingredients.every((ingredient) => ingredient.isNotEmpty), isTrue);
      }
    });

    test('does not assign database identifiers before insertion', () {
      expect(defaultMeals.every((meal) => meal.id == null), isTrue);
    });
  });
}
