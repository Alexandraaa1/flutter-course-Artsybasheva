import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/domain/entities/planet.dart';
import 'package:flutter_application_1/ui/widgets/planet_card.dart';
import 'package:flutter_application_1/bloc/planet_bloc.dart';
import 'package:flutter_application_1/bloc/planet_event.dart';
import 'package:flutter_application_1/bloc/planet_state.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {

  Set<String> _likedIds = {};
  bool _showOnlyLiked = false;
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> addPlanet() async {
    final newName = _nameController.text.trim();
    if (newName.isEmpty) return;

    final newPlanet = Planet(
      name: newName,
      subtitle: 'Добавлено пользователем',
      category: Category.planet,
      letter: newName[0].toUpperCase(),
      color: Colors.grey,
    );

    try {
  
      await FirebaseFirestore.instance
          .collection('planets')
          .add(newPlanet.toJson());
      _nameController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Ошибка: $e')));
    }
  }

  void _toggleLike(String id) {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
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
            child: BlocBuilder<PlanetBloc, PlanetState>(
              builder: (context, state) {
             
                if (state is PlanetLoadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                }

        
                if (state is PlanetLoadFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message,
                            style: const TextStyle(color: Colors.red)),
                        const SizedBox(height: 12),
                        ElevatedButton(
                        
                          onPressed: () {
                            context
                                .read<PlanetBloc>()
                                .add(PlanetLoadRequested());
                          },
                          child: const Text('Обновить'),
                        ),
                      ],
                    ),
                  );
                }

                final planets = (state as PlanetLoadSuccess).planets;

                final visiblePlanets = _showOnlyLiked
                    ? planets
                        .where((p) => p.id != null && _likedIds.contains(p.id))
                        .toList()
                    : planets;

                if (visiblePlanets.isEmpty) {
                  return const Center(child: Text('Ничего не нашлось'));
                }

                return ListView.builder(
                  itemCount: visiblePlanets.length,
                  itemBuilder: (context, index) {
                    final planet = visiblePlanets[index];
                    return PlanetCard(
                      planet: planet,
                      isLiked:
                          planet.id != null && _likedIds.contains(planet.id),
                      onLikeTap: () {
                        if (planet.id != null) _toggleLike(planet.id!);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}