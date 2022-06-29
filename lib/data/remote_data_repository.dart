import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hiddengems/data/models/place_model.dart';
import 'package:hiddengems/data/models/rating_model.dart';

class RemoteDataRepository {
  static final placesCollection =
      FirebaseFirestore.instance.collection('places');

  static final newestPlaces =
      placesCollection.orderBy("dateAdded", descending: true);

  static Future<List<PlaceModelId>> loadNearestPlaces500m(
      String query, String category, Position position) async {
    final minLat = position.latitude - 0.004;
    final maxLat = position.latitude + 0.004;
    final minLong = position.longitude - 0.004;
    final maxLong = position.longitude + 0.004;
    List<PlaceModelId> placesData = [];

    // Query utama
    Query places = placesCollection;

    // #1 Filter tempat berdasarkan kategori
    // Proses ini berjalan di Firestore/backend
    if (category.isNotEmpty) {
      places = places.where('category', isEqualTo: category);
    }

    // #2 Filter tempat berdasarkan longitude/garis vertikal
    // Proses ini berjalan di Firestore/backend
    places =
        places.where('longitude', isGreaterThan: minLong, isLessThan: maxLong);

    // Download data
    try {
      // Snapshot itu seperti daftar isi/index data yang akan didapatkan
      final snapshot = await places.get();
      // .map...dst melihat semua daftar isi
      placesData = snapshot.docs.map((doc) {
        // dan doc.data() mengambil data sebenarnya.
        final data = doc.data() as Map<String, dynamic>;
        return PlaceModelId(
            id: doc.id, placeModel: PlaceModel.fromFirestore(data));
      }).toList();
    } catch (e) {
      rethrow;
    }

    // #3 Filter tempat berdasarkan latitute/garis horizontal
    // Proses ini berjalan di aplikasi/front-end
    placesData = placesData
        .where(
          (element) =>
              element.placeModel.latitude > minLat &&
              element.placeModel.latitude < maxLat,
        )
        .toList();

    // #4 Filter nama tempat berdasarkan query pencarian
    // Proses ini berjalan di aplikasi/front-end
    if (query.isNotEmpty) {
      placesData = placesData
          .where(
            // toLowerCase biar hasil pencarian tidak
            // memperdulikan huruf besar atua kecil.
            (element) => element.placeModel.name
                .toLowerCase()
                .contains(query.toLowerCase()),
          )
          .toList();
    }

    return placesData;
  }

  static Future<DocumentReference<Map<String, dynamic>>> addPlace(
      PlaceModel placeModel) {
    return placesCollection.add(placeModel.toFirestore());
  }

  static Future<void> addRating(
      String placeId, String uid, RatingModel ratingModel) {
    try {
      return placesCollection
          .doc(placeId)
          .collection('ratings')
          .doc(uid)
          .set(ratingModel.toFirestore());
    } catch (e) {
      rethrow;
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getRatings(
      String placeId) {
    return placesCollection.doc(placeId).collection('ratings').get();
  }
}
