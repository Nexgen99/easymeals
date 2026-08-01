# Base de données d’Easy Meals

Easy Meals utilise une base SQLite locale nommée `easy_meals.db`. Le schéma commence à la version 1.

## Table `meals`

Cette table contient les idées de repas fournies par l’utilisateur.

| Colonne | Type | Rôle |
|---|---|---|
| `id` | INTEGER | Identifiant unique généré automatiquement |
| `name` | TEXT | Nom du repas |
| `emoji` | TEXT | Emoji alimentaire associé |
| `category` | TEXT | Catégorie du repas |
| `ingredients` | TEXT | Liste JSON des ingrédients |

## Table `weekly_meals`

Cette table associe un repas à chacun des sept jours d’une semaine.

| Colonne | Type | Rôle |
|---|---|---|
| `id` | INTEGER | Identifiant unique généré automatiquement |
| `week_start` | TEXT | Date ISO du lundi qui commence la semaine |
| `day_index` | INTEGER | Jour de la semaine, de 0 à 6 |
| `meal_id` | INTEGER | Référence vers `meals.id` |

La combinaison `week_start` et `day_index` est unique. Une semaine ne peut donc contenir qu’un seul repas par jour.

## Évolution du schéma

Chaque modification future du schéma augmentera `databaseVersion` et ajoutera une migration. Les données existantes ne devront pas être supprimées pendant une mise à jour normale de l’application.
