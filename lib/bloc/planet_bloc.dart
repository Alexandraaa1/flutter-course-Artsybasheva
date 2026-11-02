import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/data/repositories/planet_repository.dart';
import 'planet_event.dart';
import 'planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  final PlanetRepository _repository;

  PlanetBloc(this._repository) : super(PlanetLoadInProgress()) {
    on<PlanetLoadRequested>(_onLoadRequested);
    on<PlanetLikeToggled>(_onLikeToggled);
    on<PlanetFilterToggled>(_onFilterToggled);
    on<PlanetAddRequested>(_onAddRequested);
  }

  Future<void> _onLoadRequested(PlanetLoadRequested event, Emitter<PlanetState> emit) async {
    emit(PlanetLoadInProgress());
    
    await emit.forEach(
      _repository.getPlanetsStream(),
      onData: (planets) => PlanetLoadSuccess(
        allPlanets: planets,
        likedIds: state is PlanetLoadSuccess ? (state as PlanetLoadSuccess).likedIds : {},
        showOnlyLiked: state is PlanetLoadSuccess ? (state as PlanetLoadSuccess).showOnlyLiked : false,
      ),
      onError: (error, stackTrace) => PlanetLoadFailure('Не удалось загрузить каталог'),
    );
  }

  Future<void> _onLikeToggled(PlanetLikeToggled event, Emitter<PlanetState> emit) async {
    if (state is PlanetLoadSuccess) {
      final currentState = state as PlanetLoadSuccess;
      final newLikedIds = Set<String>.from(currentState.likedIds);
      
      if (event.isCurrentlyLiked) {
        newLikedIds.remove(event.planetId);
      } else {
        newLikedIds.add(event.planetId);
      }
      
      emit(PlanetLoadSuccess(
        allPlanets: currentState.allPlanets,
        likedIds: newLikedIds,
        showOnlyLiked: currentState.showOnlyLiked,
      ));

      await _repository.toggleFavorite(event.planetId, event.isCurrentlyLiked);
    }
  }

  void _onFilterToggled(PlanetFilterToggled event, Emitter<PlanetState> emit) {
    if (state is PlanetLoadSuccess) {
      final currentState = state as PlanetLoadSuccess;
      emit(PlanetLoadSuccess(
        allPlanets: currentState.allPlanets,
        likedIds: currentState.likedIds,
        showOnlyLiked: !currentState.showOnlyLiked,
      ));
    }
  }

  Future<void> _onAddRequested(PlanetAddRequested event, Emitter<PlanetState> emit) async {
    await _repository.addPlanet(event.planet);
    add(PlanetLoadRequested()); 
  }
}