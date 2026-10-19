import 'package:flutter/material.dart';

enum Category { planet, gasGiant, iceGiant }

class Planet {
  final int? id;
  final String name;
  final String subtitle;
  final Category category;
  final String letter;
  final Color color;
  final String? description;

  const Planet({
    this.id,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.letter,
    required this.color,
    this.description, 
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      name: json['name'] ?? 'Без названия',
      subtitle: json['subtitle'] ?? '',
      category: Category.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => Category.planet,
      ),
      letter: json['letter'] ?? '?',
      color: Color(int.parse('FF${json['color'] ?? '000000'}', radix: 16)),
      description: json['description'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subtitle': subtitle,
      'category': category.name,
      'letter': letter,
      'color': color.value.toRadixString(16).substring(2).toUpperCase(),
      'description': description ?? '',
    };
  }

  @override
  String toString() => 'Planet($id, $name)';
}