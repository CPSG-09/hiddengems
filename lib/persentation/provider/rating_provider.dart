import 'package:flutter/foundation.dart';
import 'package:hiddengems/data/auth_repository.dart';
import 'package:hiddengems/data/models/rating_model.dart';
import 'package:hiddengems/data/remote_data_repository.dart';

class RatingProvider with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  String errorMessage = '';

  List<RatingModel> ratings = [];
  bool isRated = false;
  double ratingValue = 0.0;
  bool isAbleToReview = true;

  int _totalValue = 0;
  int _numberOfRatings = 0;

  void loadRatings(String placeId) async {
    // State reset
    isLoading = true;
    isError = false;
    errorMessage = '';
    ratings.clear();
    isRated = false;
    ratingValue = 0.0;
    isAbleToReview = true;
    _totalValue = 0;
    _numberOfRatings = 0;
    notifyListeners();

    try {
      final snapshot = await RemoteDataRepository.getRatings(placeId);

      if (snapshot.docs.isEmpty) {
        isRated = false;
      } else {
        for (var element in snapshot.docs) {
          // Cek sudah review apa tidak
          if (AuthRepository.getUID() == element.id) {
            isAbleToReview = false;
          } else {
            isAbleToReview = true;
          }

          // menambah komentar rating
          final data = element.data();
          final rating = RatingModel.fromFirestore(data);
          ratings.add(rating);

          // penambahan nilai untuk perhitungan rata rata.
          _totalValue += rating.isLiking ? 1 : 0;
          _numberOfRatings += 1;
        }

        // Perhitungan rata rata
        ratingValue = _totalValue / _numberOfRatings;

        isRated = true;
      }
      isLoading = false;
      isError = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      isError = true;
      errorMessage = 'Terjadi kesalahan: $e';
      notifyListeners();
    }
  }
}
