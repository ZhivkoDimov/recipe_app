import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeWidget extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeWidget({
    Key? key,
    required this.recipes,
  }) : super(key: key);

//recipe card
  @override
  Widget build(BuildContext context) {
    return recipes.isEmpty
        ? const Center(child: Text('No recipes yet.'))
        : ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      recipe.imageUrl,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    recipe.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(recipe.description),
                  trailing: Text(
                    '${recipe.prepTime} min prep\n${recipe.cookTime} min cook',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail(recipe: recipe),
                      ),
                    );
                  },
                ),
              );
            },
          );
  }
}


class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);


//recipe page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[ Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                      recipe.imageUrl,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  Text(
                    recipe.description,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Prep Time: ${recipe.prepTime} mins",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Cook Time: ${recipe.cookTime} mins",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  
                  Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.map((ingredient) => Text(
                        "- $ingredient",
                        style: TextStyle(fontSize: 16),
                      )),
                  const Divider(height: 32),
                  Text(
                    "Instructions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.instructions.map((step) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "- $step",
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
