import 'package:flutter_application_1/domain/entities/planet.dart';

sealed class PlanetState {}

class PlanetLoadInProgress extends PlanetState {}

class PlanetLoadSuccess extends PlanetState {
  final List<Planet> allPlanets;
  final Set<String> likedIds;
  final bool showOnlyLiked;

  PlanetLoadSuccess({
    required this.allPlanets,
    required this.likedIds,
    required this.showOnlyLiked,
  });

  List<Planet> get visiblePlanets {
    if (!showOnlyLiked) return allPlanets;
    return allPlanets.where((p) => p.id != null && likedIds.contains(p.id)).toList();
  }
}

class PlanetLoadFailure extends PlanetState {
  final String message;
  PlanetLoadFailure(this.message);
}