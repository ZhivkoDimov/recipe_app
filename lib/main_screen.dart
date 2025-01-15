import 'package:flutter/material.dart';
import 'models/recipe.dart';
import 'models/workout.dart';
import 'Widgets/recipe.dart';
import 'Widgets/workouts.dart';
import 'models/new_recipe.dart';

enum SelectedType { recipes, workouts }

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  SelectedType selectedType = SelectedType.recipes;

  List<Recipe> allRecipes = [
  Recipe(
    id: '1',
    title: 'Pancakes',
    prepTime: 10,
    cookTime: 15,
    description: 'Fluffy pancakes for breakfast.',
    ingredients: ['Flour', 'Milk', 'Eggs', 'Sugar', 'Baking Powder'],
    instructions: ['Mix ingredients', 'Cook on skillet'],
    category: 'Breakfast',
    imageUrl: 'https://t3.ftcdn.net/jpg/01/22/62/62/360_F_122626251_W17wSyCosPAqYcZ76pHYJNnKVHuigMq2.jpg',
  ),
  
  Recipe(
    id: '2',
    title: 'Spaghetti',
    prepTime: 15,
    cookTime: 20,
    description: 'Classic spaghetti with tomato sauce.',
    ingredients: ['Spaghetti', 'Tomato Sauce', 'Garlic', 'Olive Oil'],
    instructions: ['Boil spaghetti', 'Prepare sauce'],
    category: 'Dinner',
    imageUrl: 'https://www.shutterstock.com/image-photo/spaghetti-isolated-on-white-background-260nw-2294827485.jpg',
  ),
  Recipe(
    id: '3',
    title: 'Brownies',
    prepTime: 15,
    cookTime: 30,
    description: 'Rich chocolate brownies.',
    ingredients: ['Flour', 'Cocoa Powder', 'Sugar', 'Butter', 'Eggs'],
    instructions: ['Mix ingredients', 'Bake in oven'],
    category: 'Dessert',
    imageUrl: 'https://sweetsavoryandsteph.com/wp-content/uploads/2021/05/IMG_1037-scaled.jpg',
  ),
  Recipe(
    id: '4',
    title: 'Caesar Salad',
    prepTime: 10,
    cookTime: 0,
    description: 'Crispy salad with Caesar dressing.',
    ingredients: ['Romaine Lettuce', 'Croutons', 'Parmesan', 'Caesar Dressing'],
    instructions: ['Toss ingredients together', 'Serve chilled'],
    category: 'Appetizer',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRk_AnEE-cK7Jdmmbs_HywfcvHWZRRGcvsgA&s',
  ),
  Recipe(
    id: '5',
    title: 'Grilled Chicken',
    prepTime: 15,
    cookTime: 30,
    description: 'Juicy grilled chicken with seasoning.',
    ingredients: ['Chicken Breast', 'Olive Oil', 'Garlic', 'Herbs'],
    instructions: ['Season chicken', 'Grill until cooked'],
    category: 'Dinner',
    imageUrl: 'https://amandascookin.com/wp-content/uploads/2009/11/grilled-chicken-garlic-marinade-680-500x500.jpg',
  ),
  Recipe(
    id: '6',
    title: 'Smoothie Bowl',
    prepTime: 10,
    cookTime: 0,
    description: 'Healthy and colorful smoothie bowl.',
    ingredients: ['Banana', 'Berries', 'Yogurt', 'Granola', 'Honey'],
    instructions: ['Blend fruits', 'Top with granola and honey'],
    category: 'Breakfast',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR87QRGEK0LcvWZNZNXOAjz_N3hgzEdW0ZhGA&s',
  ),
  Recipe(
    id: '7',
    title: 'Margherita Pizza',
    prepTime: 20,
    cookTime: 15,
    description: 'Classic pizza with tomato, mozzarella, and basil.',
    ingredients: ['Pizza Dough', 'Tomato Sauce', 'Mozzarella', 'Basil'],
    instructions: ['Assemble toppings on dough', 'Bake in oven'],
    category: 'Dinner',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1j96PcBeCX3HZlF9BMRBFrhE5994SRqYqmQ&s',
  ),
  Recipe(
    id: '8',
    title: 'Chocolate Chip Cookies',
    prepTime: 15,
    cookTime: 10,
    description: 'Chewy and gooey chocolate chip cookies.',
    ingredients: ['Flour', 'Butter', 'Sugar', 'Chocolate Chips', 'Eggs'],
    instructions: ['Mix ingredients', 'Bake in oven'],
    category: 'Dessert',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmv5FKDmnactNtxaIzHqKP_cIirqdDd5NgMg&s',
  ),
  Recipe(
    id: '9',
    title: 'Sushi Rolls',
    prepTime: 30,
    cookTime: 0,
    description: 'Homemade sushi rolls with fresh ingredients.',
    ingredients: ['Sushi Rice', 'Nori', 'Fish or Vegetables', 'Soy Sauce'],
    instructions: ['Prepare rice', 'Roll with nori and fillings'],
    category: 'Dinner',
    imageUrl: 'https://www.pressurecookrecipes.com/wp-content/uploads/2021/02/california-roll.jpg',
  ),
  Recipe(
    id: '10',
    title: 'Tomato Soup',
    prepTime: 10,
    cookTime: 20,
    description: 'Creamy and comforting tomato soup.',
    ingredients: ['Tomatoes', 'Onion', 'Garlic', 'Cream', 'Basil'],
    instructions: ['Cook ingredients', 'Blend and simmer'],
    category: 'Soup',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwP4ghcJUAkonhvNHbW5qXmHMHll_NBSRx5A&s',
  ),

];


 
  late List<Recipe> recipes;

  List<Workout> workouts = [ Workout(
      day: 'Monday',
      type: 'Upper Body (Push)',
      exercises: [
        '1. Bench Press: 4 sets x 8-10 reps, moderate-heavy weight',
        '2. Incline Dumbbell Press: 3 sets x 10-12 reps',
        '3. Overhead Shoulder Press (Barbell/Dumbbell): 4 sets x 8-10 reps',
        '4. Lateral Raises: 3 sets x 12-15 reps',
        '5. Triceps Dips (Weighted if possible): 3 sets x 10-12 reps',
        '6. Cable Tricep Pushdowns: 3 sets x 12-15 reps',
      ],
    ),
    Workout(
      day: 'Tuesday',
      type: 'Lower Body (Quad Focus)',
      exercises: [
        '1. Back Squats: 4 sets x 8-10 reps, moderate-heavy weight',
        '2. Bulgarian Split Squats: 3 sets x 10-12 reps per leg',
        '3. Leg Press: 4 sets x 8-12 reps',
        '4. Walking Lunges: 3 sets x 12-15 reps per leg',
        '5. Leg Extensions (Machine): 3 sets x 12-15 reps',
        '6. Standing Calf Raises: 4 sets x 15-20 reps',
      ],
    ),
    Workout(
      day: 'Wednesday',
      type: 'Cardio/Active Recovery',
      exercises: [
        'Choose one: 30-45 minutes steady-state cardio (e.g., cycling, jogging, brisk walking) or 20-30 minutes HIIT',
        'Stretching or foam rolling afterward',
      ],
    ),

    Workout(
      day: 'Thursday',
      type: 'Upper Body (Pull)',
      exercises: [
        '1. Pull-Ups: 4 sets x 8-10 reps',
        '2. Bent-Over Rows: 3 sets x 10-12 reps',
        '3. Lat Pulldowns: 4 sets x 8-10 reps',
        '4. Bicep Curls: 3 sets x 12-15 reps',
        '5. Hammer Curls: 3 sets x 10-12 reps',
      ],
    ),

    Workout(
      day: 'Friday',
      type: 'Lower Body (Legs)',
      exercises: [
        '1. Leg Press: 4 sets x 8-12 reps',
        '2. Leg Extensions: 3 sets x 10-12 reps',
        '3. Leg Curls: 3 sets x 12-15 reps',
      ],
    ),

    Workout(
      day: 'Saturday',
      type: 'Rest',
      exercises: [
        'Rest day',
      ],
    ),

    Workout(
      day: 'Sunday',
      type: 'Rest',
      exercises: [
        'Rest day',
      ],
    ),
  ];

  late List<List<bool>> completedExercises;

  int _selectedIndex = 0;
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    recipes = List.from(allRecipes);
    completedExercises = List.generate(
      workouts.length,
      (index) => List.filled(workouts[index].exercises.length, false),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      selectedType = index == 0 ? SelectedType.recipes : SelectedType.workouts;
    });
  }

  void _addRecipe(Recipe recipe) {
    setState(() {
      allRecipes.add(recipe);
      recipes = List.from(allRecipes);
    });
  }

  void _openAddRecipeOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewRecipe(onAddRecipe: _addRecipe),
    );
  }

  void searchRecipes(String query, String category) {
    List<Recipe> filteredRecipes = List.from(allRecipes);

    if (category != 'All') {
      filteredRecipes = filteredRecipes.where((recipe) => recipe.category == category).toList();
    }

    if (query.isNotEmpty) {
      filteredRecipes = filteredRecipes.where((recipe) =>
          recipe.title.toLowerCase().contains(query.toLowerCase())).toList();
    }

    setState(() {
      recipes = filteredRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['All'];
    categories.addAll(allRecipes.map((recipe) => recipe.category).toSet().toList());

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes & Workouts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          if (selectedType == SelectedType.recipes)
            IconButton(
              onPressed: _openAddRecipeOverlay,
              icon: const Icon(Icons.add),
            ),
        ],
      ),
      body: selectedType == SelectedType.recipes
          ? RecipeWidget(recipes: recipes)
          : WorkoutWidget(
              workouts: workouts,
              completedExercises: completedExercises,
              onExerciseChanged: (workoutIndex, exerciseIndex, value) {
                setState(() {
                  completedExercises[workoutIndex][exerciseIndex] = value;
                });
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Search Recipes'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: selectedCategory,
                    items: categories.map<DropdownMenuItem<String>>((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                        searchRecipes('', selectedCategory);
                      }
                    },
                  ),
                  TextField(
                    onChanged: (value) {
                      searchRecipes(value, selectedCategory);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter recipe name to search',
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Reset filters
                        selectedCategory = 'All';
                        recipes = List.from(allRecipes);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Reset Filters'),
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.filter_list),
      ),
    );
  }
}
