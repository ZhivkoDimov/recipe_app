import 'package:flutter/material.dart';
import '../../models/recipe.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({super.key, required this.onAddRecipe});

  final void Function(Recipe recipe) onAddRecipe;

  @override
  State<NewRecipe> createState() {
    return _NewRecipeState();
  }
}

  class _NewRecipeState extends State<NewRecipe> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _ingredientsController = TextEditingController();
  Category _selectedCategory = Category.breakfast;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    _instructionsController.dispose();
    _ingredientsController.dispose();
    super.dispose();
  }

 

  void _submitRecipeData() {
    final enteredAmount = int.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.isEmpty ||
        amountIsInvalid || _descriptionController.text.isEmpty || _instructionsController.text.isEmpty || _ingredientsController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure you provide valid values for every field.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay')),
          ],
        ),
      );
      return;
    }

    widget.onAddRecipe(Recipe(
      id: _titleController.text,
      title: _titleController.text,
        prepTime: enteredAmount,
        cookTime: int.parse(_amountController.text),
        description: _descriptionController.text,
        ingredients: _ingredientsController.text.split(',').map((ingredient) => ingredient.trim()).toList(),
        instructions: _instructionsController.text.split(',').map((instruction) => instruction.trim()).toList(),
        category: _selectedCategory.name,
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    prefixText: '\min',
                    label: Text('Prep time'),
                    prefixIcon: Icon(Icons.timer),
                  ),
                ),
                
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [    
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _descriptionController,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                  ),
                ),
              ),
            ],
          ),
           Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ingredientsController,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    label: Text('Ingredients'),
                  ),
                ),
              ),
            ],
          ),
           Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _instructionsController,
                  maxLength: 200,
                  decoration: const InputDecoration(
                    label: Text('Instructions'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value as Category;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: _submitRecipeData,
                  child: const Text('Save Recipe')),
            ],
          ),
        ],
      ),
    );
  }
}
