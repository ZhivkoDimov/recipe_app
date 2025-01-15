import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


const uuid = Uuid();

enum Category { breakfast, lunch, dinner }


class Recipe {
  final String id;
  final String title;
  final int prepTime;
  final int cookTime;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final String category;
  final String imageUrl; 

  Recipe({
    required this.id,
    required this.title,
    required this.prepTime,
    required this.cookTime,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.category,
    required this.imageUrl, 
  });
}



class recipeBucket {
  const recipeBucket({
    required this.category,
    required this.recipes,
  });

  recipeBucket.forCategory(List<Recipe> allRecipes, this.category)
      : recipes = allRecipes
            .where((recipe) => recipe.category == category)
            .toList();

  final Category category;
  final List<Recipe> recipes;

  double get totalRecipes {
    double sum = 0;

    for (final recipe in recipes) {
      sum += recipe.prepTime; 
    }

    return sum;
  }
}


