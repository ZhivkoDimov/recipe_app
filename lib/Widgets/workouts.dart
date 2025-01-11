import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutWidget extends StatelessWidget {
  final List<Workout> workouts;
  final List<List<bool>> completedExercises;
  final Function(int workoutIndex, int exerciseIndex, bool value) onExerciseChanged;

  const WorkoutWidget({
    Key? key,
    required this.workouts,
    required this.completedExercises,
    required this.onExerciseChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return workouts.isEmpty
        ? const Center(child: Text('No workouts available.'))
        : ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, workoutIndex) {
              final workout = workouts[workoutIndex];
              return ExpansionTile(
                title: Text(workout.day),
                subtitle: Text(workout.type),
                children: workout.exercises.asMap().entries.map((entry) {
                  final exerciseIndex = entry.key;
                  final exercise = entry.value;
                  return CheckboxListTile(
                    title: Text(exercise),
                    value: completedExercises[workoutIndex][exerciseIndex],
                    onChanged: (bool? value) {
                      onExerciseChanged(workoutIndex, exerciseIndex, value ?? false);
                    },
                  );
                }).toList(),
              );
            },
          );
  }
}
