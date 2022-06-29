import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModelId {
  final String id;
  final PlaceModel placeModel;
  PlaceModelId({
    required this.id,
    required this.placeModel,
  });
}

class PlaceModel {
  final String name;
  final String address;
  final double longitude;
  final double latitude;
  final String openingHours;
  final String category;
  final DateTime dateAdded;

  const PlaceModel({
    required this.name,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.openingHours,
    required this.category,
    required this.dateAdded,
  });

  Map<String, dynamic> toFirestore() => {
        "name": name,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "openingHours": openingHours,
        "category": category,
        "dateAdded": Timestamp.fromDate(dateAdded),
      };

  factory PlaceModel.fromFirestore(Map<String, dynamic> json) {
    Timestamp dateAddedTimestamp = json["dateAdded"] as Timestamp;
    DateTime dateAdded = dateAddedTimestamp.toDate();
    return PlaceModel(
      name: json["name"],
      address: json["address"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      openingHours: json["openingHours"],
      category: json["category"],
      dateAdded: dateAdded,
    );
  }
}
