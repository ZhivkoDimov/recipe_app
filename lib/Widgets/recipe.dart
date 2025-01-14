import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);
  
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
      body: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30, child: Container(decoration: BoxDecoration(border: Border.all()), child: Center (child: Text(recipe.description, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),),),
              
              SizedBox(height: 20, child: Container(decoration: BoxDecoration(border: Border.all()), child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text("Prep Time: ${recipe.prepTime.toString()}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, ),),
                Text("Cook Time: ${recipe.cookTime.toString()}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
              ],),),),
              SizedBox(height: 25 , child: Container(decoration: BoxDecoration(border: Border.all()), child: Center(child: Text("Ingredients", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),),),),
              SizedBox(child: Container(decoration: BoxDecoration(border: Border.all()), child: Center(child: Text(recipe.ingredients.join('\n'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),),),),
              SizedBox(height: 25 , child: Container(decoration: BoxDecoration(border: Border.all()), child: Center(child: Text("Instructions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),),),),
              SizedBox(child: Container(decoration: BoxDecoration(border: Border.all()), child: Center(child: Text(recipe.instructions.join('\n'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),),),),
            ],
            ),
          ),
        ),
      
    );
  }
}

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
              return Card(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), child: SizedBox(height: 70, child: ListTile(
                title: Text(recipe.title),
                subtitle: Text(recipe.description),
                trailing: Text(
                    '${recipe.prepTime} min prep, ${recipe.cookTime} min cook'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RecipeDetail(recipe: recipe),
                    ),
                  );
                },
              ),
            ),
              ),);},
            );
  }
}