import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hiddengems/data/device_repository.dart';
import 'package:hiddengems/data/models/place_model.dart';
import 'package:hiddengems/data/remote_data_repository.dart';

class SearchProvider with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;

  String category = '';
  String query = '';

  List<PlaceModel> near500mPlaces = [];
  // List<PlaceModel> near1000mPlaces = [];

  void loadNearstPlace() async {
    // Clear the list and set loading
    isLoading = true;
    near500mPlaces.clear();
    // near1000mPlaces.clear();
    notifyListeners();

    // Get location
    Position position = await DeviceRepository.determinePosition();

    // Load the places
    try {
      near500mPlaces = await RemoteDataRepository.loadNearestPlaces500m(
          query, category, position);
      isError = false;
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
    }

    // Finish loading
    isLoading = false;
    notifyListeners();
  }
}
