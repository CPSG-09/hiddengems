import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hiddengems/data/device_repository.dart';

class AddPlaceProvider with ChangeNotifier {
  bool isLoading = false;
  bool isLocationError = false;

  String errorMessage = '';

  late Position position = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  void loadAddPlace() async {
    isLoading = true;
    notifyListeners();

    try {
      position = await DeviceRepository.determinePosition();
      Future.delayed(const Duration(seconds: 1));
      isLocationError = false;
    } catch (e) {
      errorMessage = e.toString();
      isLocationError = true;
    }

    isLoading = false;
    notifyListeners();
  }
}
