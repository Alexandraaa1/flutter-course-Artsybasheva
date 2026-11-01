import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/domain/entities/planet.dart';
import 'planet_event.dart';
import 'planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  PlanetBloc() : super(PlanetLoadInProgress()) {
    on<PlanetLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
      PlanetLoadRequested event, Emitter<PlanetState> emit) async {
    
    emit(PlanetLoadInProgress());

    await emit.forEach(
      FirebaseFirestore.instance.collection('planets').snapshots(),
      onData: (snapshot) {
        final planets = snapshot.docs
            .map((doc) => Planet.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>))
            .toList();
        return PlanetLoadSuccess(planets);
      },
      onError: (error, stackTrace) {
        return PlanetLoadFailure('Не удалось загрузить каталог');
      },
    );
  }
}