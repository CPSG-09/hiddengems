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
  int scrollIndex = 0;

  List<PlaceModelId> near500mPlaces = [];

  void loadNearstPlace() async {
    // if (category == '') {
    //   scrollIndex = 0;
    // } else {
    //   int index = 0;
    //   AppCommon.placeCategories.asMap().forEach((key, element) {
    //     if (element == category) {
    //       index = key;
    //     }
    //   });
    //   scrollIndex = index;
    // }
    // notifyListeners();

    // Membersihkan daftar
    isLoading = true;
    near500mPlaces.clear();
    notifyListeners();

    // Mencari posisi GPS
    Position position = await DeviceRepository.determinePosition();

    // Download tempatnya
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
