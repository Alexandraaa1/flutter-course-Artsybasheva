import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/planet.dart';
import 'package:flutter_application_1/ui/widgets/planet_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  static const List<Planet> planets = [
    Planet(
      id: 1,
      name: 'Меркурий',
      subtitle: '1-я планета · +167°C',
      category: Category.planet,
      letter: 'Ме',
      color: Color(0xFF6E6E6E),
    ),
    Planet(
      id: 2,
      name: 'Венера',
      subtitle: '2-я планета · +464°C',
      category: Category.planet,
      letter: 'В',
      color: Color(0xFFE8A33D),
    ),
    Planet(
      id: 3,
      name: 'Земля',
      subtitle: '3-я планета · +15°C',
      category: Category.planet,
      letter: 'З',
      color: Color(0xFF1E88E5),
    ),
    Planet(
      id: 4,
      name: 'Марс',
      subtitle: '4-я планета · −63°C',
      category: Category.planet,
      letter: 'Ма',
      color: Color(0xFFC1440E),
    ),
    Planet(
      id: 5,
      name: 'Юпитер',
      subtitle: '5-я планета · −108°C',
      category: Category.gasGiant,
      letter: 'Ю',
      color: Color(0xFFB07D4C),
    ),
    Planet(
      id: 6,
      name: 'Сатурн',
      subtitle: '6-я планета · −139°C',
      category: Category.gasGiant,
      letter: 'С',
      color: Color(0xFFD4A857),
    ),
    Planet(
      id: 7,
      name: 'Уран',
      subtitle: '7-я планета · −195°C',
      category: Category.iceGiant,
      letter: 'У',
      color: Color(0xFF7FCDD6),
    ),
    Planet(
      id: 8,
      name: 'Нептун',
      subtitle: '8-я планета · −201°C',
      category: Category.iceGiant,
      letter: 'Н',
      color: Color(0xFF3559B5),
    ),
  ];

  Set<int> _likedIds = {};
  bool _showOnlyLiked = false;

  void _toggleLike(int id) {
    setState(() {
      if (_likedIds.contains(id)) {
        _likedIds.remove(id);
      } else {
        _likedIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final visiblePlanets = _showOnlyLiked
        ? planets.where((p) => _likedIds.contains(p.id)).toList()
        : planets;

    return Scaffold(
      backgroundColor: const Color(0xFFE8EEF7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Каталог планет',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'В избранном: ${_likedIds.length}',
              style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showOnlyLiked = !_showOnlyLiked;
                    });
                  },
                  child: Text(
                    _showOnlyLiked ? '✓ Только избранные' : 'Только избранные',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: visiblePlanets.isEmpty
                ? const Center(child: Text('Ничего не нашлось'))
                : ListView.builder(
                    itemCount: visiblePlanets.length,
                    itemBuilder: (context, index) {
                      final planet = visiblePlanets[index];
                      return PlanetCard(
                        planet: planet,
                        isLiked: _likedIds.contains(planet.id),
                        onLikeTap: () => _toggleLike(planet.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}