import 'package:flutter_application_1/domain/entities/planet.dart';

sealed class PlanetEvent {}

class PlanetLoadRequested extends PlanetEvent {}

class PlanetLikeToggled extends PlanetEvent {
  final String planetId;
  final bool isCurrentlyLiked;
  PlanetLikeToggled(this.planetId, this.isCurrentlyLiked);
}

class PlanetFilterToggled extends PlanetEvent {}

class PlanetAddRequested extends PlanetEvent {
  final Planet planet;
  PlanetAddRequested(this.planet);
}