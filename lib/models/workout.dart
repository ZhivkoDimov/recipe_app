import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Workout {
  final String day;
  final String type;
  final List<String> exercises;

  Workout({
    required this.day,
    required this.type,
    required this.exercises,
  });
}
