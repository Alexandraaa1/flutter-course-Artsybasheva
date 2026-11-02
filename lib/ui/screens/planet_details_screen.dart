import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/planet.dart';

class PlanetDetailsScreen extends StatelessWidget {
  final Planet planet;
  final bool isLiked;

  const PlanetDetailsScreen({super.key, required this.planet, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(planet.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'planet_cover_${planet.id}',
              child: Container(
                height: 250,
                color: planet.color,
                child: Center(
                  child: Text(
                    planet.letter,
                    style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planet.name, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(planet.subtitle, style: const TextStyle(fontSize: 20, color: Colors.grey)),
                  const SizedBox(height: 16),
                  Text('Категория: ${planet.category.name}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  Text(planet.description ?? 'Описание пока отсутствует', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}