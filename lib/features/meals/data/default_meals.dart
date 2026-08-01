import '../domain/meal.dart';

/// Repas installés lors de la première ouverture de l'application.
const List<Meal> defaultMeals = <Meal>[
  Meal(
    name: 'Spaghetti bolognaise',
    emoji: '🍝',
    category: 'Pâtes',
    ingredients: <String>[
      'Spaghetti',
      'Bœuf haché',
      'Sauce tomate',
      'Oignon',
    ],
  ),
  Meal(
    name: 'Tacos au poulet',
    emoji: '🌮',
    category: 'Mexicain',
    ingredients: <String>[
      'Tortillas',
      'Poulet',
      'Laitue',
      'Tomate',
      'Fromage',
    ],
  ),
  Meal(
    name: 'Pâté chinois',
    emoji: '🥘',
    category: 'Plat principal',
    ingredients: <String>['Bœuf haché', 'Maïs', 'Pommes de terre'],
  ),
  Meal(
    name: 'Saumon et riz',
    emoji: '🍣',
    category: 'Poisson',
    ingredients: <String>['Saumon', 'Riz', 'Brocoli', 'Citron'],
  ),
  Meal(
    name: 'Pizza maison',
    emoji: '🍕',
    category: 'Pizza',
    ingredients: <String>[
      'Pâte à pizza',
      'Sauce tomate',
      'Mozzarella',
      'Poivron',
    ],
  ),
  Meal(
    name: 'Sauté de poulet',
    emoji: '🍗',
    category: 'Volaille',
    ingredients: <String>[
      'Poulet',
      'Riz',
      'Poivron',
      'Brocoli',
      'Sauce soya',
    ],
  ),
  Meal(
    name: 'Chili végétarien',
    emoji: '🫘',
    category: 'Végétarien',
    ingredients: <String>[
      'Haricots rouges',
      'Haricots noirs',
      'Tomates',
      'Maïs',
      'Oignon',
    ],
  ),
  Meal(
    name: 'Hamburgers',
    emoji: '🍔',
    category: 'Grillades',
    ingredients: <String>[
      'Pains à hamburger',
      'Bœuf haché',
      'Laitue',
      'Tomate',
      'Fromage',
    ],
  ),
  Meal(
    name: 'Soupe poulet et nouilles',
    emoji: '🍜',
    category: 'Soupe',
    ingredients: <String>[
      'Poulet',
      'Nouilles',
      'Carottes',
      'Céleri',
      'Bouillon de poulet',
    ],
  ),
  Meal(
    name: 'Omelette aux légumes',
    emoji: '🍳',
    category: 'Déjeuner',
    ingredients: <String>['Œufs', 'Poivron', 'Champignons', 'Fromage'],
  ),
  Meal(
    name: 'Curry de pois chiches',
    emoji: '🍛',
    category: 'Végétarien',
    ingredients: <String>[
      'Pois chiches',
      'Lait de coco',
      'Tomates',
      'Épinards',
      'Riz',
    ],
  ),
  Meal(
    name: 'Quesadillas',
    emoji: '🫓',
    category: 'Mexicain',
    ingredients: <String>['Tortillas', 'Fromage', 'Poulet', 'Poivron'],
  ),
  Meal(
    name: 'Macaroni au fromage',
    emoji: '🧀',
    category: 'Pâtes',
    ingredients: <String>['Macaroni', 'Cheddar', 'Lait', 'Beurre'],
  ),
  Meal(
    name: 'Salade César au poulet',
    emoji: '🥗',
    category: 'Salade',
    ingredients: <String>[
      'Laitue romaine',
      'Poulet',
      'Parmesan',
      'Croûtons',
      'Sauce César',
    ],
  ),
];
