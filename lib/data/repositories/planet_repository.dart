import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/domain/entities/planet.dart';

class PlanetRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Planet>> getPlanetsStream() {
    return _db.collection('planets').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Planet.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>))
          .toList();
    });
  }

  Future<void> addPlanet(Planet planet) async {
    await _db.collection('planets').add(planet.toJson());
  }

  Stream<List<String>> getUserFavoritesStream() {
    final uid = _auth.currentUser!.uid;
    return _db.collection('users').doc(uid).snapshots().map((doc) {
      if (!doc.exists) return [];
      final data = doc.data();
      return List<String>.from(data?['favorites'] ?? []);
    });
  }

  Future<void> toggleFavorite(String planetId, bool isCurrentlyLiked) async {
    final uid = _auth.currentUser!.uid;
    final userDoc = _db.collection('users').doc(uid);

    if (isCurrentlyLiked) {
      await userDoc.update({
        'favorites': FieldValue.arrayRemove([planetId])
      });
    } else {
      await userDoc.set({
        'favorites': FieldValue.arrayUnion([planetId])
      }, SetOptions(merge: true));
    }
  }
}