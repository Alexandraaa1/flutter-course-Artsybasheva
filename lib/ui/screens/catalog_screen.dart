import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/domain/entities/planet.dart';
import 'package:flutter_application_1/ui/widgets/planet_card.dart';

const String baseUrl = 'https://6ad5f6a8f71f154ac486407e.mockapi.io';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Planet> _planets = [];
  bool _isLoading = false;
  String? _error;

  Set<int> _likedIds = {};
  bool _showOnlyLiked = false;

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPlanets();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> loadPlanets() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http.get(Uri.parse('$baseUrl/planets'));
      
      if (response.statusCode != 200) {
        throw Exception('Статус ${response.statusCode}');
      }

      final list = jsonDecode(response.body) as List;
      
      setState(() {
        _planets = list.map((e) => Planet.fromJson(e)).toList();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> addPlanet() async {
    final newName = _nameController.text.trim();
    
    if (newName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите название планеты')),
      );
      return; 
    }

    final newPlanet = Planet(
      name: newName,
      subtitle: 'Добавлено пользователем',
      category: Category.planet,
      letter: newName[0].toUpperCase(),
      color: Colors.grey, 
    );

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/planets'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(newPlanet.toJson()), 
      );

      if (response.statusCode != 201) {
        throw Exception('Статус ${response.statusCode}');
      }

      final created = Planet.fromJson(jsonDecode(response.body));

      setState(() {
        _planets.insert(0, created);
        _nameController.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка отправки: $e')),
      );
    }
  }

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
        ? _planets.where((p) => p.id != null && _likedIds.contains(p.id)).toList()
        : _planets;

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
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Название планеты',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addPlanet,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _showOnlyLiked = !_showOnlyLiked;
                });
              },
              child: Text(
                _showOnlyLiked ? '✓ Только избранные' : 'Только избранные',
              ),
            ),
          ),
          Expanded(
            child: _buildBody(visiblePlanets),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(List<Planet> visiblePlanets) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ошибка: $_error', style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: loadPlanets,
              child: const Text('Обновить'),
            ),
          ],
        ),
      );
    }

    if (visiblePlanets.isEmpty) {
      return const Center(child: Text('Ничего не нашлось'));
    }

    return ListView.builder(
      itemCount: visiblePlanets.length,
      itemBuilder: (context, index) {
        final planet = visiblePlanets[index];
        return PlanetCard(
          planet: planet,
          isLiked: planet.id != null && _likedIds.contains(planet.id),
          onLikeTap: () {
            if (planet.id != null) _toggleLike(planet.id!);
          },
        );
      },
    );
  }
}