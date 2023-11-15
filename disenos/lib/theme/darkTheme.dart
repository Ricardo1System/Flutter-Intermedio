


import 'package:flutter/material.dart';

final ThemeData darkThemeFile= ThemeData.dark().copyWith(
  primaryColor: Colors.teal,
  textTheme: const TextTheme().copyWith(
    bodyLarge: const TextStyle(color: Colors.amber)
  )
);