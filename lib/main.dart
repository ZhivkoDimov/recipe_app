import 'package:flutter/material.dart';
import 'main_screen.dart';

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 4, 2, 60),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.secondaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primary,
        ),
        scaffoldBackgroundColor: kDarkColorScheme.primaryContainer,
        cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.onInverseSurface,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.secondaryContainer,
          ),
        ),
        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            shadows: [
              Shadow(
                color: Colors.grey,
                offset: Offset(1, 1),
              ),
            ],
            color: kDarkColorScheme.onSecondaryContainer,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home:  MainScreen(),
    ),
  );
}