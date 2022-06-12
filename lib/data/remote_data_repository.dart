import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hiddengems/data/models/place_model.dart';

class RemoteDataRepository {
  static final placesCollection =
      FirebaseFirestore.instance.collection('places');

  static final newestPlaces =
      placesCollection.orderBy("dateAdded", descending: true);

  static Future<List<PlaceModel>> loadNearestPlaces500m(
      String query, String category, Position position) async {
    final minLat = position.latitude - 0.004;
    final maxLat = position.latitude + 0.004;
    final minLong = position.longitude - 0.004;
    final maxLong = position.longitude + 0.004;
    List<PlaceModel> placesData = [];

    // Main query
    Query places = placesCollection;

    // #1 Filter by category
    if (category.isNotEmpty) {
      places = places.where('category', isEqualTo: category);
    }

    // #2 Filter by longitude
    places =
        places.where('longitude', isGreaterThan: minLong, isLessThan: maxLong);

    // Get data locally
    try {
      QuerySnapshot querySnapshot = await places.get();
      placesData = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return PlaceModel.fromFirestore(data);
      }).toList();
    } catch (e) {
      rethrow;
    }

    // #3 Filter by longitude
    placesData = placesData
        .where(
          (element) => element.latitude > minLat && element.latitude < maxLat,
        )
        .toList();

    // #4 Filter by search query
    if (query.isNotEmpty) {
      placesData = placesData
          .where(
            (element) => element.name.contains(query),
          )
          .toList();
    }

    return placesData;
  }

  static Future<DocumentReference<Map<String, dynamic>>> addPlace(
      PlaceModel placeModel) {
    return placesCollection.add(placeModel.toFirestore());
  }
}
