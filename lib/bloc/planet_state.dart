import 'package:flutter_application_1/domain/entities/planet.dart';

sealed class PlanetState {}

class PlanetLoadInProgress extends PlanetState {}

class PlanetLoadSuccess extends PlanetState {
  final List<Planet> planets;
  PlanetLoadSuccess(this.planets);
}

class PlanetLoadFailure extends PlanetState {
  final String message;
  PlanetLoadFailure(this.message);
}