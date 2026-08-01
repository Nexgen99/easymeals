import 'dart:convert';

/// Représente une idée de repas enregistrée dans l'application.
class Meal {
  const Meal({
    this.id,
    required this.name,
    required this.emoji,
    required this.category,
    this.ingredients = const <String>[],
  });

  final int? id;
  final String name;
  final String emoji;
  final String category;
  final List<String> ingredients;

  Meal copyWith({
    int? id,
    String? name,
    String? emoji,
    String? category,
    List<String>? ingredients,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      category: category ?? this.category,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  /// Convertit le repas en valeurs compatibles avec SQLite.
  Map<String, Object?> toMap() {
    return <String, Object?>{
      if (id != null) 'id': id,
      'name': name,
      'emoji': emoji,
      'category': category,
      'ingredients': jsonEncode(ingredients),
    };
  }

  /// Reconstruit un repas à partir d'une ligne SQLite.
  factory Meal.fromMap(Map<String, Object?> map) {
    final rawIngredients = map['ingredients'] as String? ?? '[]';
    final decodedIngredients = jsonDecode(rawIngredients) as List<dynamic>;

    return Meal(
      id: map['id'] as int?,
      name: map['name'] as String,
      emoji: map['emoji'] as String,
      category: map['category'] as String,
      ingredients: decodedIngredients.cast<String>(),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Meal &&
            id == other.id &&
            name == other.name &&
            emoji == other.emoji &&
            category == other.category &&
            _listsAreEqual(ingredients, other.ingredients);
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        emoji,
        category,
        Object.hashAll(ingredients),
      );

  static bool _listsAreEqual(List<String> first, List<String> second) {
    if (first.length != second.length) {
      return false;
    }

    for (var index = 0; index < first.length; index++) {
      if (first[index] != second[index]) {
        return false;
      }
    }

    return true;
  }
}
