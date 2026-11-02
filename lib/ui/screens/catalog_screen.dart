import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/domain/entities/planet.dart';
import 'package:flutter_application_1/ui/widgets/planet_card.dart';
import 'package:flutter_application_1/ui/screens/planet_details_screen.dart';
import 'package:flutter_application_1/bloc/planet_bloc.dart';
import 'package:flutter_application_1/bloc/planet_event.dart';
import 'package:flutter_application_1/bloc/planet_state.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EEF7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Каталог планет', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: BlocBuilder<PlanetBloc, PlanetState>(
        builder: (context, state) {
          if (state is PlanetLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PlanetLoadFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => context.read<PlanetBloc>().add(PlanetLoadRequested()),
                    child: const Text('Обновить'),
                  ),
                ],
              ),
            );
          }

          final loadedState = state as PlanetLoadSuccess;
          final visiblePlanets = loadedState.visiblePlanets;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('В избранном: ${loadedState.likedIds.length}', style: const TextStyle(fontSize: 16, color: Colors.blueGrey)),
                    TextButton(
                      onPressed: () => context.read<PlanetBloc>().add(PlanetFilterToggled()),
                      child: Text(loadedState.showOnlyLiked ? '✓ Только избранные' : 'Только избранные'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: visiblePlanets.isEmpty
                    ? const Center(child: Text('В избранном пока пусто'))
                    : ListView.builder(
                        itemCount: visiblePlanets.length,
                        itemBuilder: (context, index) {
                          final planet = visiblePlanets[index];
                          final isLiked = planet.id != null && loadedState.likedIds.contains(planet.id);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PlanetDetailsScreen(planet: planet, isLiked: isLiked),
                                ),
                              );
                            },
                            child: PlanetCard(
                              planet: planet,
                              isLiked: isLiked,
                              onLikeTap: () {
                                if (planet.id != null) {
                                  context.read<PlanetBloc>().add(PlanetLikeToggled(planet.id!, isLiked));
                                }
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddPlanetSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddPlanetSheet(BuildContext context) {
    final nameController = TextEditingController();
    final planetBloc = context.read<PlanetBloc>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (bottomSheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
            left: 16, right: 16, top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Название планеты', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  final newName = nameController.text.trim();
                  if (newName.isNotEmpty) {
                    final newPlanet = Planet(
                      name: newName,
                      subtitle: 'Добавлено пользователем',
                      category: Category.planet,
                      letter: newName[0].toUpperCase(),
                      color: Colors.grey,
                    );
                    planetBloc.add(PlanetAddRequested(newPlanet));
                    Navigator.pop(bottomSheetContext);
                  }
                },
                child: const Text('Добавить'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}