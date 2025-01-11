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
  List<Recipe> recipes = [
    Recipe(
        id: '1',
        title: 'Pancakes',
        prepTime: 10,
        cookTime: 15,
        description: 'Fluffy pancakes for breakfast.',
        ingredients: ['Flour', 'Milk', 'Eggs', 'Sugar', 'Baking Powder'],
        instructions: ['Mix ingredients', 'Cook on skillet'],
        category: 'Breakfast',
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
      ),
  ];
  List<Workout> workouts = [
    Workout(
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
    // Add more workout days as needed
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

  @override
  void initState() {
    super.initState();
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
      recipes.add(recipe);
    });
  }

  void _openAddRecipeOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewRecipe(onAddRecipe: _addRecipe),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym Ready!'),
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
    );
  }
}