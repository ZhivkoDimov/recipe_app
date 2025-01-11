import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeWidget extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeWidget({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return recipes.isEmpty
        ? const Center(child: Text('No recipes yet.'))
        : ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return ListTile(
                title: Text(recipe.title),
                subtitle: Text(recipe.description),
                trailing: Text(
                    '${recipe.prepTime} min prep, ${recipe.cookTime} min cook'),
              );
            },
          );
  }
}