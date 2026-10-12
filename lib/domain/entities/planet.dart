import 'package:flutter/material.dart';

enum Category {planet, gasGiant, iceGiant}

class Planet {
  final int id;
  final String name;
  final String subtitle;
  final Category category;
  final String letter;
  final Color color;
  final String? description;

  const Planet({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.letter,
    required this.color,
    this.description,
  });
    @override
  String toString() => 'Planet($id, $name)';
}